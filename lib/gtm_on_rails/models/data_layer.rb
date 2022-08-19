# Class to take a roll as dataLayer of javascript's variable
module GtmOnRails
  class DataLayer
    include ActionView::Helpers::TagHelper

    attr_accessor :objects, :objects_before_page_view

    def initialize(*args)
      options  = args.extract_options!
      @objects = [args].flatten # @objects are instances of GTM::DataLayerObject

      @objects_before_page_view = []
    end

    def push(args, **options)
      args = [args].flatten
      args.each do |object|
        case object
        when Hash
          obj = GtmOnRails::DataLayer::Object.new(**object)
        when GtmOnRails::DataLayer::Object
          obj = object
        end

        if options[:before_page_view]
          @objects_before_page_view << obj
        else
          @objects << obj
        end
      end
    end

    def to_js(before_page_view: false)
      js_codes = []

      js_codes << "var dataLayer = dataLayer || [];"

      objs = before_page_view ? @objects_before_page_view : @objects
      objs.each do |data_layer_object|
        # dataLayer size limit exception
        size = data_layer_object.to_json.bytesize
        if size > GtmOnRails.config.data_layer_limit_byte_size
          Rails.logger.warn("DataLayer bytesize is over limit #{GtmOnRails.config.data_layer_limit_byte_size} bytes. Size is #{size} bytes.")
          next
        end

        js_codes << data_layer_object.to_js
      end

      return js_codes.join.html_safe
    end

    def print_on_html(before_page_view: false)
      content_tag(:script, self.to_js(before_page_view: before_page_view))
    end

    def method_missing(method, *args, &block)
      if @objects.respond_to?(method)
        @objects.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to?(method, include_all=false)
      Array.new.respond_to?(method, include_all) || super
    end
  end
end

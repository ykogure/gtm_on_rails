# Class to take a roll as javascript's object in dataLayer
module GtmOnRails
  class DataLayerObject
    attr_accessor :data

    def initialize(**args)
      @data = args.with_indifferent_access
    end

    def add(**hash)
      @data.merge!(hash)
    end

    def to_json
      @data.to_json
    end

    def to_js
      "dataLayer.push(#{self.to_json});"
    end

    def method_missing(method, *args, &block)
      if method.to_s.end_with?('=')
        key     = method.to_s.chop.to_sym
        _method = :[]=
        _args   = [key] + args
      else
        key     = method
        _method = :[]
        _args   = [key]
      end

      if @data.has_key?(key)
        @data.send(_method, *_args)
      else
        super
      end
    end
  end
end

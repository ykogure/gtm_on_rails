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

    def method_missing(method, *args, &block)
      if @data.has_key?(method)
        @data[method]
      else
        super
      end
    end
  end
end

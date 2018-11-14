require 'yaml'

class HotelParser
  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
    HotelObject.new(YAML.load_file(filename))
  end

  class HotelObject

    def initialize(data)
      @data = data
    end

    def [](key)
      data[key]
    end

    private

    attr_reader :data


    def method_missing(method, *args, &block)
      return process(data[method.to_s]) if data[method.to_s]

      raise ArgumentError.new("Method `#{method}` doesn't exist.")
    end

    def process(data)
      return data.map {|datum| process(datum) } if data.is_a? Array
      data.is_a?(Hash) ? HotelObject.new(data) : data
    end
  end
end

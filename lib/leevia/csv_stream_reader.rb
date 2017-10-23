require 'csv'
require_relative './decorators/city'

module Leevia
  class CsvStreamReader
    attr_reader :path, :strategy, :options

    def initialize(path:, strategy:, options:{})
      @path = path
      @strategy = strategy
      @options = options
    end

    def read()
      CSV.open(path, options) do |io_csv|
        strategy.new(io_csv.each).extract.map do |row|
          Leevia::Decorators::City.new(row)
        end
      end
    end
  end
end

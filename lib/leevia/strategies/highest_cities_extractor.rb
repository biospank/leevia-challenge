require_relative './extractor_strategy'

module Leevia
  module Strategies
    class HighestCitiesExtractor < ExtractorStrategy
      def extract
        highest_cities
      end

      private

      def highest_cities
        per_country.max_by(per_country.length) do |city|
          altitude(city)
        end
      end

      def per_country
        @highest_cities ||= country_iterator.map do |country, cities|
          order_by_highest(cities)
        end
      end

      def country_iterator
        iterator.chunk { |row| country_name(row) }
      end

      def order_by_highest(cities)
        cities.max_by { |city| altitude(city) }
      end

      def country_name(row)
        row.fetch(1)
      end

      def altitude(row)
        row.fetch(5).to_i
      end
    end
  end
end

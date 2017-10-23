module Leevia
  module Decorators
    class City
      attr_reader :name, :country_name, :altitude

      def initialize(row)
        @name = name_for(row)
        @country_name = country_name_for(row)
        @altitude = altitude_for(row)
      end

      def to_s
        "#{altitude}m - #{name}, #{country_name}"
      end

      private

      def name_for(row)
        row.fetch(2)
      end

      def country_name_for(row)
        row.fetch(1)
      end

      def altitude_for(row)
        row.fetch(5).to_i
      end
    end
  end
end

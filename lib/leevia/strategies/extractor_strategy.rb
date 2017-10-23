module Leevia
  module Strategies
    class ExtractorStrategy
      attr_reader :iterator

      def initialize(iterator)
        @iterator = iterator
      end

      def extract
        raise NotImplementedError, "Subclass must implement this method"
      end
    end
  end
end

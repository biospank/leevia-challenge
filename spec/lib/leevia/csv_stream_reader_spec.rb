require_relative '../../../lib/leevia/csv_stream_reader'
require_relative '../../../lib/leevia/strategies/highest_cities_extractor'

RSpec.describe Leevia::CsvStreamReader do
  describe 'read' do
    subject {
      Leevia::CsvStreamReader.new(
        path: File.expand_path('./resources/World_Cities_Location_table.csv'),
        strategy: Leevia::Strategies::HighestCitiesExtractor,
        options: { col_sep: ';' }
      )
    }

    it "returns an array of 155 highest world cities" do
      expect(subject.read.length).to be 155
    end
  end
end

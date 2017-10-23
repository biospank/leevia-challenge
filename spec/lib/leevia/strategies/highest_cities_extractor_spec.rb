RSpec.describe Leevia::Strategies::HighestCitiesExtractor do
  describe '#extract' do
    subject {
      Leevia::Strategies::HighestCitiesExtractor.new(cities_list.each)
    }

    let(:cities_list) {
      [
        ["1", "Italy", "Arezzo", "42.3662222", "42.3652222", "400"],
        ["2", "Italy", "Milano", "42.3572222", "20.0730553", "300"],
        ["3", "France", "Parigi", "42.3662222", "42.3652222", "200"],
        ["4", "France", "Bouluard", "42.5562222", "42.3652222", "800"],
        ["5", "Germany", "Stutgart", "42.3362222", "42.5352222", "700"],
        ["6", "Germany", "Monaco", "42.7362222", "42.3252222", "820"]
      ]
    }
    let(:ordered_cities) {
      [
        ["6", "Germany", "Monaco", "42.7362222", "42.3252222", "820"],
        ["4", "France", "Bouluard", "42.5562222", "42.3652222", "800"],
        ["1", "Italy", "Arezzo", "42.3662222", "42.3652222", "400"]
      ]
    }

    it 'returns a list ordered by highest city altitude per country' do
      expect(subject.extract).to match_array(ordered_cities)
    end
  end
end

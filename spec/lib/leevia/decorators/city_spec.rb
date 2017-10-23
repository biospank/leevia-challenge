RSpec.describe Leevia::Decorators::City do
  subject { Leevia::Decorators::City.new(data) }

  let(:data) {
    ["1", "Italy", "Arezzo", "42.3662222", "42.3652222", "400"]
  }

  describe 'attribute readers' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:country_name) }
    it { is_expected.to respond_to(:altitude) }
  end

  describe '#to_s' do
    it 'convert data to string' do
      expect(subject.to_s).to match("400m - Arezzo, Italy")
    end
  end
end

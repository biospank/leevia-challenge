RSpec.describe Leevia::Strategies::ExtractorStrategy do

  describe 'inherited class' do
    subject {
      Class.new(Leevia::Strategies::ExtractorStrategy)
    }
    let(:extractor) { subject.new([].each) }

    it 'is expected to respnd to #extract' do
      expect(extractor).to respond_to(:extract)
    end

    context 'with unimplemented #extract method' do
      it 'raise NotImplementedError' do
        expect { extractor.extract }.to raise_error(NotImplementedError)
      end
    end
  end

end

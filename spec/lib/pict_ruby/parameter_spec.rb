RSpec.describe PictRuby::Parameter do
  describe '#shape' do
    let(:params) do
      [
        %w[iPhone Pixel],
        %w[IOS Android],
        %w[Firefox Chrome]
      ]
    end

    it 'returns shaped parameter' do
      actual = described_class.new(params).shape
      expect(actual).to eq("param1: iPhone,Pixel\nparam2: IOS,Android\nparam3: Firefox,Chrome")
    end
  end
end

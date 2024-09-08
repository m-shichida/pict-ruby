RSpec.describe PictRuby::Parameter do
  describe '.shape' do
    let(:parameter) do
      [
        %w[iPhone Pixel],
        %w[IOS Android],
        %w[Firefox Chrome]
      ]
    end

    it 'returns shaped parameter' do
      actual = described_class.shape(parameter)
      expect(actual).to eq("param1: iPhone,Pixel\nparam2: IOS,Android\nparam3: Firefox,Chrome")
    end
  end
end

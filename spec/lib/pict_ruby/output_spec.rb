RSpec.describe PictRuby::Output do
  describe '.parse' do
    let(:output) do
      "param1\tparam2\tparam3\niPhone\tAndroid\tFirefox\nPixel\tIOS\tChrome"
    end

    it 'parses the output into an array of hashes' do
      expected_result = [
        { 'param1' => 'iPhone', 'param2' => 'Android', 'param3' => 'Firefox' },
        { 'param1' => 'Pixel', 'param2' => 'IOS', 'param3' => 'Chrome' }
      ]

      actual_result = described_class.parse(output)
      expect(actual_result).to eq(expected_result)
    end
  end
end

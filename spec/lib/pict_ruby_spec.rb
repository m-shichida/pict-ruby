# frozen_string_literal: true

RSpec.describe PictRuby do
  describe 'Version' do
    it 'has a version number' do
      expect(PictRuby::VERSION).to be('0.1.0')
    end
  end

  describe '.generate_test_cases' do
    let(:params) do
      [
        %w[iPhone Pixel],
        %w[IOS Android],
        %w[Firefox Chrome]
      ]
    end

    it 'returns test cases' do
      actual = PictRuby.generate_test_cases(params)
      expect(actual).to eq(
        [{ 'param1' => 'Pixel', 'param2' => 'Android', 'param3' => 'Chrome' },
         { 'param1' => 'Pixel', 'param2' => 'IOS', 'param3' => 'Firefox' },
         { 'param1' => 'iPhone', 'param2' => 'IOS', 'param3' => 'Chrome' },
         { 'param1' => 'iPhone', 'param2' => 'Android', 'param3' => 'Firefox' }]
      )
    end
  end
end

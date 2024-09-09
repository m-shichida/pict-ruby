module PictRuby
  class Parameter
    def initialize(params, options = {})
      @params = params
      @options = options
    end

    def shape
      @params.map.with_index do |param, index|
        "param#{index + 1}: #{param.join(',')}"
      end.join("\n")
    end
  end
end

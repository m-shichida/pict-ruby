module PictRuby
  module Parameter
    def self.shape(parameter)
      parameter.map.with_index do |param, index|
        "param#{index + 1}: #{param.join(',')}"
      end.join("\n")
    end
  end
end

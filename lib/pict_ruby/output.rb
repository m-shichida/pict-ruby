module PictRuby
  module Output
    def self.parse(output)
      lines = output.split("\n")
      headers = lines.shift.split("\t")
      lines.map do |line|
        values = line.split("\t")
        headers.zip(values).to_h
      end
    end
  end
end

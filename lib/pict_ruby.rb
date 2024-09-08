# frozen_string_literal: true

require 'open3'

module PictRuby
  PICT_EXEC_PATH = File.expand_path(File.join(__dir__, '..', 'tools', 'pict'))

  class << self
    def generate_test_cases(params)
      input = Parameter.shape(params)

      tempfile = Tempfile.new('pict_input')
      begin
        tempfile.write(input)
        tempfile.close

        output, status = Open3.capture2("#{PICT_EXEC_PATH} #{tempfile.path}")
        raise "PICT execution failed. output: #{output}" unless status.success?

        output
      ensure
        tempfile.unlink
      end
    end

    private

    def parse_output(output)
      lines = output.split("\n")
      headers = lines.shift.split("\t")
      lines.map do |line|
        values = line.split("\t")
        headers.zip(values).to_h
      end
    end
  end

  module Parameter
    def self.shape(parameter)
      parameter.map.with_index do |param, index|
        "param#{index + 1}: #{param.join(',')}"
      end.join("\n")
    end
  end
end

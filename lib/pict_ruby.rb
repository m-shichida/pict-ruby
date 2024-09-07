# frozen_string_literal: true

require 'open3'

module PictRuby
  PICT_EXEC_PATH = File.expand_path(File.join(__dir__, '..', 'tools', 'pict.exe'))

  class << self
    def generate_test_cases(parameters)
      input = parameters.map.with_index do |param, index|
        "param#{index + 1}: #{param.join(' ')}"
      end.join("\n")

      output, status = Open3.capture2("#{PICT_EXEC_PATH}", stdin_data: input)
      raise 'PICT execution failed' unless status.success?

      parse_output(output)
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
end

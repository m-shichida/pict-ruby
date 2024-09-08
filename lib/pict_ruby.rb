# frozen_string_literal: true

require 'open3'
require 'tempfile'

module PictRuby
  PICT_EXEC_PATH = File.expand_path(File.join(__dir__, '..', 'tools', 'pict'))

  class << self
    def generate_test_cases(params)
      input = Parameter.shape(params)
      output, status = Execution.execute(input)
      raise "PICT execution failed. output: #{output}" unless status.success?

      Output.parse(output)
    end
  end

  module Parameter
    def self.shape(parameter)
      parameter.map.with_index do |param, index|
        "param#{index + 1}: #{param.join(',')}"
      end.join("\n")
    end
  end

  module Execution
    def self.execute(input)
      tempfile = ::Tempfile.new('pict_input')
      tempfile.write(input)
      tempfile.close
      output, status = Open3.capture2("#{PICT_EXEC_PATH} #{tempfile.path}")
      tempfile.unlink

      [output, status]
    end
  end

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

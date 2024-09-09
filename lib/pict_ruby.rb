# frozen_string_literal: true

require 'open3'

require_relative 'pict_ruby/parameter'
require_relative 'pict_ruby/execution'
require_relative 'pict_ruby/output'

module PictRuby
  class << self
    def generate_test_cases(params, options = {})
      input = Parameter.new(params, options).shape
      output, status = Execution.execute(input)
      raise "PICT execution failed. output: #{output}" unless status.success?

      Output.parse(output)
    end
  end
end

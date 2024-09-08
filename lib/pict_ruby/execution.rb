require 'tempfile'

module PictRuby
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
end

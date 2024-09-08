require 'open3'

RSpec.describe PictRuby::Execution do
  describe '.execute' do
    let(:input) { "param1: iPhone,Pixel\nparam2: IOS,Android\nparam3: Firefox,Chrome" }
    let(:tempfile_path) { '/tmp/pict_input' }
    let(:fake_output) { "iPhone\tIOS\tFirefox\nPixel\tAndroid\tChrome" }
    let(:fake_status) { instance_double(Process::Status, success?: true) }

    before do
      allow(Tempfile).to receive(:new).and_return(instance_double(Tempfile, path: tempfile_path, write: nil, close: nil, unlink: nil))
      allow(Open3).to receive(:capture2).with("#{PictRuby::Execution::PICT_EXEC_PATH} #{tempfile_path}")
                                        .and_return([fake_output, fake_status])
    end

    it 'executes PICT and returns the output and status' do
      output, status = described_class.execute(input)

      expect(output).to eq(fake_output)
      expect(status).to eq(fake_status)
    end
  end
end

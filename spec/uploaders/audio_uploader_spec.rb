describe AudioUploader do
  include CarrierWave::Test::Matchers

  before do
    # @song = Fabricate(:song)
    AudioUploader.enable_processing = true
    @uploader = AudioUploader.new(@song, :audiofile)
    file = File.open('spec/support/data/song1.mp3')
    @uploader.store!(file)
  end

  after do
    AudioUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumbnail' do
    it 'should scale down to 40x40' do
      @uploader.thumb.should have_dimensions(40, 40)
    end
  end
end

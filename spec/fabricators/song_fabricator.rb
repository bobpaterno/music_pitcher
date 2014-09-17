Fabricator(:song) do
  title { sequence(:title) { |i| "Song#{i}" } }
  artist { sequence(:artist) { |i| "Artist#{i}" } }
  genre { sequence(:genre) { |i| "Genre#{i}" } }
  audiofile { File.new(File.join(Rails.root, 'spec', 'support', 'data', 'pretty.mp3')) }
end

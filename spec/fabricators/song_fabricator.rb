Fabricator(:song) do
  title { sequence(:title) { |i| "Song#{i}" } }
  artist { sequence(:artist) { |i| "Artist#{i}" } }
  genre { sequence(:genre) { |i| "Genre#{i}" } }
  audiofile "file.mp3"
end

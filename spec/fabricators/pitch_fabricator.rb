Fabricator(:pitch) do
  pitch_to { sequence(:pitch_to) { |i| "Pitchee#{i}" } }
  # listened_to { false }
  email { "a@a.com" }
  subject { "regarding blah" }
  message { "dear so and so" }
end

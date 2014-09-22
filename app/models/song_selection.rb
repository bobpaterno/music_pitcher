class SongSelection < ActiveRecord::Base
  belongs_to :pitch
  belongs_to :song
end

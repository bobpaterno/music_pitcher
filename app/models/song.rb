require 'file_size_validator'

class Song < ActiveRecord::Base
  mount_uploader :audiofile, AudioUploader

  has_many :song_selections
  has_many :pitches, through: :song_selections

  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :genre
  validates_presence_of :audiofile
  validates :description, length: { maximum: 200 }
  validates :audiofile, :file_size => { :maximum => 50.megabytes.to_i }

end

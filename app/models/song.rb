class Song < ActiveRecord::Base
  mount_uploader :audiofile, AudioUploader

  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :genre
  validates_presence_of :audiofile
  validates :description, length: { maximum: 200 }
end

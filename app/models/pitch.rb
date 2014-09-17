class Pitch < ActiveRecord::Base
  after_validation :populate_default_values, on: :create

  validates_presence_of :pitch_to
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :message
  validates :subject, length: { maximum: 140 }

  def populate_default_values
    self.listened_to = false
  end
end

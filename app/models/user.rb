class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

end

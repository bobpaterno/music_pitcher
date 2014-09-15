require 'rails_helper'

RSpec.describe Song, :type => :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :artist }
  it { should validate_presence_of :genre }
  it { should validate_presence_of :audiofile }
  it { should ensure_length_of(:description).is_at_most(200) }
end

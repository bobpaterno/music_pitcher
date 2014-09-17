require 'rails_helper'

RSpec.describe Pitch, :type => :model do
  it { should validate_presence_of :pitch_to }
  it { should validate_presence_of :email }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :message }
  it { should ensure_length_of(:subject).is_at_most(140) }
end

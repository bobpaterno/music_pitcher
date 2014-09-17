
RSpec.describe User, :type => :model do
  before do
    Fabricate(:user)
  end

  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
  it { should validate_uniqueness_of :username }
end

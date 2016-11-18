require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a name" do
    user = User.new(name: "Bryan")
    assert user.name == "Bryan"
  end
end

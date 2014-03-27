require 'spec_helper'

describe User do

  it "is valid with an email" do
    user = User.new(
      email: "joe@example.com"
    )
    expect(user).to be_valid
  end

  it "is not valid without email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is invalid without a salt"

  it "is invalid without a fish"

end

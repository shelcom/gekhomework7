require "rails_helper"
require "paperclip/matchers"
require 'spec_helper'


RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
  
  describe User do
  it "dont have attached file" do should have_attached_file(:avatar)
  end
  it "validate paperclip" do should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') 
              end
end

end



RSpec.describe User, :type => :model do
	
describe '#email' do
  
    it 'validates presence' do
      record = User.new
      record.email = '' 
      record.valid?
      record.errors[:email].should include("can't be blank") 

      record.email = 'sadasd@gmail.com' # valid state
      record.valid? # run validations
      record.errors[:email].should_not include("can't be blank") 
    end
end

describe "Validations" do

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
end

it "can't be blank" do
  user = User.create(:name => "")
  user.valid?
  user.errors.should have_key(:name)
end

 describe "Validations" do
    context "on a new user" do
      it "should not be valid without a password" do
        user = User.new password_digest: nil
        user.should_not be_valid
      end
    end
  end



end


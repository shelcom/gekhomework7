require "rails_helper"
require "paperclip/matchers"



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
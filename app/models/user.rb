class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true, uniqueness: true
  attr_accessor :name, :password_digest, :password_confirmation
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => 6..10
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 def editor? 
	self.role == 'editor' 
 end
	
	def admin? 
		self.role == 'admin' 
	end
	
	
end

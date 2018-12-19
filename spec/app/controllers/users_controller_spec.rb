require "rails_helper"

RSpec.describe UsersController,:type => :controller do
	let!(:users) { User.create!(id:'1', email: 'ghrj@hgh.com', password: 'aaddasf', password_digest: 'aaddasf', role: 'admin', name:'sadsad') }
	before { allow(controller).to receive(:current_user) { user } }
	describe "GET index" do
	 	before do
			users
			get :index
	    end
	    
	    it "when users is present" do
	       expect(assigns(:users)).to include(users)
	    end
	end
	

end
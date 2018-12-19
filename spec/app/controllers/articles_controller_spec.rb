require "rails_helper"

RSpec.describe ArticlesController,:type => :controller do
 let!(:article) { Article.create( name: "asd", text: "asd") }
 let(:user) { User.create(email:"admin@gmail.com", name:"dsdsd", password: "admin" ) }

  before { allow(controller).to receive(:current_user) { user } }
  
  describe "GET index" do
    before do
      article
      get :index
    end
    context 'when articles is present' do
      it{ expect(assigns(:articles)).to include(article) }
    end
    
    context 'when articles is not present' do
      it{ expect(assigns(:articles)).not_to include(nil) }
    end
  end


  describe "GET show" do
    context 'when params id is present' do
        before do
          article
          get :show, params: { id: article.id }
        end
      it{ expect(assigns(:articles)).to eq(article) }
    end
  end
  
  describe "GET new" do
    context 'assigns new @article' do
        before do
          article
          get :new
        end
       it{  expect(assigns(:article)).to be_a_new Article}
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: article.id }}
    it 'assigns @article' do
    expect(assigns(:article)).to eq article
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the article' do
    expect do
      delete :destroy, params: { id: article.id }
    end.to change(Article, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    let(:update_attributes) do
    {
        name: article.name,
        text: article.text
    }
    end

    it 'saves updated article' do
    expect do
      patch :update, params: { id: article.id, article: update_attributes }
    end.to change(Article, :count).by(0)
  end
  end
end

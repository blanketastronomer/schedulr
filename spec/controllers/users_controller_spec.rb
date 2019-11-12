require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      @user = FactoryBot.create(:user)
      sign_in @user
      get :show
      expect(response).to have_http_status(:success)
      expect(@user.id).to eq(1)
    end
  end

end

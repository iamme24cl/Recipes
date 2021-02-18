require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:attributes) do
    {
      name: "Test Lama",
      email: "test@mail.com",
      password: "password"
    }
  end

  # it "renders the show template" do
  #   user = User.create!(attributes)
  #   get :show, id: user.id
  #   expect(response).to render_template(:show)
  # end
end

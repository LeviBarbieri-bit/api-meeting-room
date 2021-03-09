require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET index" do
        it "returns a 200" do
        #request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
            get :index
            expect(response).to have_http_status(:ok)
        end
    end

    describe "POST create" do
        it "returns a 200" do
         #request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
            post :create, :params => { name: 'levi', email: 'levibarbieri@gmail.com', password: 'q1w2e3r4' }
            expect(response).to have_http_status(:ok)
        end
    end

end
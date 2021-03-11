require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do

    describe "GET index" do
        it "returns a 200" do
            request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
            get :index
            expect(response).to have_http_status(:ok)
        end
    end

    describe "POST create" do
        it "returns a 200" do
           request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
           post :create, :params => { user_id: "1", time: "10:20", date: "05-05-2021", description: "loren ipsun" }
           
           expect(response).to have_http_status(:ok)
        end
    end

    describe 'DELETE #destroy' do
        context "success" do
          it "deletes the Schedule" do
            expect{ 
              delete :destroy, :params => {id: 2}
           }.to change(Schedule, :count).by(-1)
          end
        end
    end

    describe "put update" do
        it "returns a 200" do
           request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
           put :update, :params => { time: "10:20", date: "02-05-2021", description: "aaaaaa", id: 2 }
           
           expect(response).to have_http_status(:ok)
        end
    end


end

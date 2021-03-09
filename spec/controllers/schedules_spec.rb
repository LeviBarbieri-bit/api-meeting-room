require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do

    describe "GET index" do
        it "returns a 200" do
            request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
            get :index
            expect(response).to have_http_status(:ok)
        end
    end

    #describe "POST create" do
        # it "returns a 200" do
           # request.headers["Authorization"] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg"
           # post :create, :params => { user_id: "2", time: "10:20", date: "05-05-2021", description: "loren ipsun" }
           
           # @expected = { 
            #    :status  => :ok,
           # }.to_json

        #   response.body.should == @expected
        #end
    #end

    
end
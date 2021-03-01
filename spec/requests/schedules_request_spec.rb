require 'rails_helper'

RSpec.describe "Schedules", type: :request do
    describe 'POST /create'  do
        it 'should be successful' do
            post '/schedules/create', params: {users_id: "3", time: "03:00", date: "2021-05-20", description:"teste or teste or teste"}
        
            expect(response).to have_http_status(200)
        end
    end
end

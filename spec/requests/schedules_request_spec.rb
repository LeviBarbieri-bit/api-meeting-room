require 'rails_helper'

RSpec.describe "Schedules", type: :request do
    describe 'POST /create'  do
        it 'should be successful' do
            post '/schedules/create', params: {users_id: 1, time: "04:00", date: "2021-05-20", 
                description:"loren ipsun"
            }      
            expect(response).to have_http_status(200)
        end
    end
end


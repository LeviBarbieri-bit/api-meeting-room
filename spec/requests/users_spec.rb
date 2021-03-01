require 'rails_helper'

describe 'POST /user#create'  do
    it 'create new user' do
        expect {
            post '/register', params: {users: {name: 'jessica', email: 'jessica@test.com', password: 'q1w2e3r4'}}
        }.to change { User.count }.from(0).to(1)

        expect(response).to have_http_status(200)
    end
end
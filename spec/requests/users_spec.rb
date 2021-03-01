require 'rails_helper'

describe 'POST /register'  do
    it 'should be successful' do
        post '/register', params: {users: {name: 'jessica', email: 'jessica@test.com', password: 'q1w2e3r4'}}
    
        expect(response).to have_http_status(200)
    end
end

describe 'POST /login'  do
    it 'should be successful' do
        
        post '/login', params: {email: 'levibarbieri@gmail.com', password: 'q1w2e3r4'}
        
        expect(response).to have_http_status(200)
    end
end

describe 'delete /destroy'  do
    context "success" do

        it "deletes the user" do
            expect{ 
                delete '/destroy', params: {id: '4'}
            }.to change(User, :count).by(-1)
        end

    end
end

describe 'get /users'  do
    it 'should be successful' do
        
        get '/users'
        expect(response).to have_http_status(200)
    end
end
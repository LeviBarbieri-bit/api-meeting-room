require 'rails_helper'

RSpec.describe 'Schedules', type: :request do
  TOKEN = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg'
  describe 'GET index' do
    it 'returns data schedules' do
      get '/schedules/list', headers: { 'Authorization': "Bearer #{TOKEN}" }
      puts response.body
    end
  end

  describe 'POST create' do
    it 'returns a 200' do
      post '/schedules/create',
           params: { user_id: '1', schedule: '2021-05-14T19:29:13.079-03:00', description: 'loren ipsun' }, headers: { 'Authorization': "Bearer #{TOKEN}" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    it 'error validation' do
      post '/schedules/create',
           params: { user_id: '1', schedule: '2021-02-15T19:29:13.079-03:00', description: 'loren ipsun' }, headers: { 'Authorization': "Bearer #{TOKEN}" }

      parsed_body = JSON.parse(response.body)

      parsed_body['schedule'] == 'Esta data já está expirada, favor agendar um novo período !!!'
    end
  end

  describe 'DELETE #destroy' do
    context 'delete' do
      it 'the Schedule' do
        delete '/schedules/destroy/13', headers: { 'Authorization': "Bearer #{TOKEN}" }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'put update' do
    it 'returns a 200' do
      put '/schedules/update',
          params: { schedule: '2021-03-30T19:29:13.079-03:00', description: 'loren ipsun', id: 8, user_id: 1 }, headers: { 'Authorization': "Bearer #{TOKEN}" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'put update' do
    it 'returns user does not exist' do
      put '/schedules/update',
          params: { schedule: '2021-03-30T19:29:13.079-03:00', description: 'loren ipsun', id: 6, user_id: 1 }, headers: { 'Authorization': "Bearer #{TOKEN}" }

      parsed_body = JSON.parse(response.body)

      parsed_body['user'] == 'must exist'
    end
  end
end

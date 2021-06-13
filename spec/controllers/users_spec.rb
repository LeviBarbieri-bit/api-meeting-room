require 'rails_helper'

RSpec.describe 'login', type: :request do
  describe 'POST create' do
    it 'returns a 200' do
      post '/register', params: { name: 'levi', email: 'levibarbieri@gmail.com', password: 'q1w2e3r4' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'post ' do
    URL = '/auto_login'

    context 'then the request authentication header' do
      it 'must return unauth message' do
        get URL
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request contains an authentication header' do
      it 'must return the users information' do
        get URL,
            headers: { 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg' }
        puts response.body
      end
    end
  end
end

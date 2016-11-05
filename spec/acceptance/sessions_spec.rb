require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  post '/auth/sign_in' do
    it 'create - not authorized example' do
      explanation 'When user is logged out or has no permission to add a bus'
      do_request format: :json, brand: 'porshe', spaces: '10'
      expect(status).to be 401
    end

    it 'create - should create a bus' do
      user = create :user
      do_request format: :json, email: user.email, password: 'password'
      expect(status).to be 200
      body = JSON.parse(response_body)
      expect(body['data']).to include({
        'id' => user.id,
        'email' => user.email,
        'provider' => 'email'
      })

      expect(response_headers).to include({
        "token-type"=>"Bearer",
         "uid"=>user.email
      })
      expect(response_headers['access-token']).to be_present
    end
  end
end


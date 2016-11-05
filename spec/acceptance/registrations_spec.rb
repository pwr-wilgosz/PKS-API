require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Registrations' do
  post '/auth' do
    it 'should register the user' do
      expect do
        do_request format: :json, email: 'sample@email.com', password: 'password', password_confirmation: 'password'
      end.to change { User.count }.by(1)

      user = User.find_by(email: 'sample@email.com')
      body = JSON.parse(response_body)

      expect(status).to be 200
      expect(body["status"]).to eq 'success'
      expect(body["data"]).to include ({
        'id' => user.id,
        'provider' => 'email',
        'uid' => user.email
      })
    end

    it 'should not register user with invalid data' do
      expect do
        do_request format: :json, password: 'password', password_confirmation: 'other'
      end.not_to change{ User.count }

      expect(status).to be 422
      body = JSON.parse(response_body)
      expect(body['status']).to eq 'error'

      expect(body['errors']).to eq( {
       "password_confirmation"=>["doesn't match Password"],
       "email"=>["can't be blank", "is not an email"],
       "full_messages"=> ["Password confirmation doesn't match Password", "Email can't be blank", "Email is not an email"]
      })
    end
  end
end


require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Buses' do
  let(:user) { create :user, role: 'admin' }

  before { user.create_new_auth_token }

  get '/buses' do
    it 'index - list buses' do
      create :bus
      do_request format: :json
      expect(status).to be 200
    end
  end

  post '/buses' do
    it 'create - not authorized example' do
      explanation 'When user is logged out or has no permission to add a bus'
      expect do
        do_request format: :json, brand: 'porshe', spaces: '10'
      end.not_to change{ Bus.count }
      expect(status).to be 401
    end

    context 'when authorized' do
      before do
        token = user.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'create - invalid object' do
        do_request
        expect(status).to be 422
      end

      it 'create - creates a bus' do
        do_request brand: 'porshe', spaces: '10', registration_number: 'DW 1123'

        expect(status).to be 201
      end
    end
  end
end


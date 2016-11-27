require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Issues' do
  let(:bus) { create :bus, issues: [create(:issue)] }
  let(:issue) { bus.issues.first }

  get 'buses/:bus_id/issues' do
    it 'index - not available for logged out users' do
      do_request bus_id: bus.id
      expect(status).to be 401
    end

    context 'when passenger authorized' do
      let(:passenger) { create :user, role: 'passenger' }
      before do
        token = passenger.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'index - not available for passenger' do
        do_request bus_id: bus.id
        expect(status).to be 403
      end
    end

    context 'when driver authorized' do
      let(:driver) { create :user, role: 'driver' }
      before do
        token = driver.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'index - accessible by driver' do
        do_request bus_id: bus.id
        expect(status).to be 200
      end
    end

    context 'when mechanic authorized' do
      let(:mechanic) { create :user, role: 'mechanic' }
      before do
        token = mechanic.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'index - accessible by mechanic' do
        do_request bus_id: bus.id
        expect(status).to be 200
      end
    end

    context 'when admin authorized' do
      let(:admin) { create :user, role: 'admin' }
      before do
        token = admin.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'index - accessible by admin' do
        do_request bus_id: bus.id
        expect(status).to be 200
      end
    end
  end

  post '/buses/:bus_id/issues' do
    it 'create issue - not available for logged out users' do
      do_request bus_id: bus.id
      expect(status).to be 401
    end

    context 'when passenger authorized' do
      let(:passenger) { create :user, role: 'passenger' }
      before do
        token = passenger.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'forbidden' do
        do_request bus_id: bus.id, name: "Sample", description: "Sample", solved: "true"
        expect(status).to be 403
      end
    end

    context 'when driver authorized' do
      let(:driver) { create :user, role: 'driver' }
      before do
        token = driver.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'valid issue - should create new issue' do
        do_request bus_id: bus.id, name: "Sample", description: "Sample", solved: "true"
        expect(status).to be 201
      end

      it 'invalid issue - should not create new issue' do
        explanation("description is required")
        do_request bus_id: bus.id, name: "Sample", description: nil, solved: "true"
        expect(status).to be 422
      end

      it 'invalid issue - should not create new issue' do
        explanation("name must be at least 2 characters")
        do_request bus_id: bus.id, name: "S", description: "Sample", solved: "true"
        expect(status).to be 422
      end
    end

    context 'when mechanic authorized' do
      let(:mechanic) { create :user, role: 'mechanic' }
      before do
        token = mechanic.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'valid issue - should create new issue' do
        do_request bus_id: bus.id, name: "Sample", description: "Sample", solved: "true"
        expect(status).to be 201
      end
    end

    context 'when admin authorized' do
      let(:admin) { create :user, role: 'admin' }
      before do
        token = admin.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'valid issue - should create new issue' do
        do_request bus_id: bus.id, name: "Sample", description: "Sample", solved: "true"
        expect(status).to be 201
      end
    end
  end

  delete '/issues/:id' do
    it 'delete issue - not available for logged out users' do
      do_request bus_id: issue.bus_id
      expect(status).to be 401
    end

    context 'when passenger authorized' do
      let(:passenger) { create :user, role: 'passenger' }
      before do
        token = passenger.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'delete - not available for passenger' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 403
      end
    end

    context 'when driver authorized' do
      let(:driver) { create :user, role: 'driver' }
      before do
        token = driver.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'delete - not available for driver' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 403
      end
    end

    context 'when mechanic authorized' do
      let(:mechanic) { create :user, role: 'mechanic' }
      before do
        token = mechanic.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'delete - should delete issue' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 204
      end
    end

    context 'when admin authorized' do
      let(:admin) { create :user, role: 'admin' }
      before do
        token = admin.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'delete - should delete issue' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 204
      end
    end
  end

  put '/issues/:id' do
    it 'update - not available for logged out users' do
      do_request bus_id: bus.id
      expect(status).to be 401
    end

    context 'when passenger authorized' do
      let(:passenger) { create :user, role: 'passenger' }
      before do
        token = passenger.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'update - not available for passenger' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 403
      end
    end

    context 'when driver authorized' do
      let(:driver) { create :user, role: 'driver' }
      before do
        token = driver.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'update - not available for driver' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 403
      end
    end

    context 'when mechanic authorized' do
      let(:mechanic) { create :user, role: 'mechanic' }
      before do
        token = mechanic.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'update - should delete issue' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 204
      end
    end

    context 'when admin authorized' do
      let(:admin) { create :user, role: 'admin' }
      before do
        token = admin.create_new_auth_token
        header 'access-token', token['access-token']
        header 'client', token['client']
        header 'token-type', token['token-type']
        header 'uid', token['uid']
      end

      it 'update - should delete issue' do
        do_request bus_id: bus.id, id: issue.id
        expect(status).to be 204
      end
    end
  end
end


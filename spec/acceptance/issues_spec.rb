require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Issues' do
  let(:bus) { create :bus, issues: [create(:issue)] }

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

    context 'when passenger authorized' do
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
  end
end


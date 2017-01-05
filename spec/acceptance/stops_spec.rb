require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Stops' do
  let(:stop) { create :stop, courses: [create(:course)] }
  let(:course) { stop.courses.first }

  context 'not authorized' do
    get '/stops' do
      it 'index - list stops' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/stops/:id' do
      it 'show - show stop' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    get '/stops/:id/courses' do
      it 'show - show stop courses' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    post '/stops' do
      it 'post - only authorized' do
        do_request id: stop.id
        expect(status).to be 401
      end
    end

    put '/stops/:d' do
      it 'put - only authorized' do
        do_request id: stop.id
        expect(status).to be 401
      end
    end

    delete '/stops/:id' do
      it 'delete - only authorized' do
        do_request id: stop.id
        expect(status).to be 401
      end
    end
  end

  context 'authorized - driver' do
    let(:driver) { create :user, role: 'driver' }
    before do
      token = driver.create_new_auth_token
      header 'access-token', token['access-token']
      header 'client', token['client']
      header 'token-type', token['token-type']
      header 'uid', token['uid']
    end

    get '/stops' do
      it 'index - list stops' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/stops/:id' do
      it 'show - show stop' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    get '/stops/:id/courses' do
      it 'show - show stop courses' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    post '/stops' do
      it 'post - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    put '/stops/:id' do
      it 'put - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    delete '/stops/:id' do
      it 'delete - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end
  end

  context 'authorized - mechanic' do
    let(:mechanic) { create :user, role: 'mechanic' }
    before do
      token = mechanic.create_new_auth_token
      header 'access-token', token['access-token']
      header 'client', token['client']
      header 'token-type', token['token-type']
      header 'uid', token['uid']
    end

    get '/stops' do
      it 'index - list stops' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/stops/:id' do
      it 'show - show stop' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    get '/stops/:id/courses' do
      it 'show - show stop courses' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    post '/stops' do
      it 'post - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    put '/stops/:id' do
      it 'put - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    delete '/stops/:id' do
      it 'delete - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end
  end

  context 'authorized - passenger' do
    let(:passenger) { create :user, role: 'passenger' }
    before do
      token = passenger.create_new_auth_token
      header 'access-token', token['access-token']
      header 'client', token['client']
      header 'token-type', token['token-type']
      header 'uid', token['uid']
    end

    get '/stops' do
      it 'index - list stops' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/stops/:id' do
      it 'show - show stop' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    get '/stops/:id/courses' do
      it 'show - show stop courses' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    post '/stops' do
      it 'post - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    put '/stops/:id' do
      it 'put - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end

    delete '/stops/:id' do
      it 'delete - access denied' do
        do_request id: stop.id
        expect(status).to be 403
      end
    end
  end

  context 'authorized - admin' do
    let(:admin) { create :user, role: 'admin' }
    before do
      token = admin.create_new_auth_token
      header 'access-token', token['access-token']
      header 'client', token['client']
      header 'token-type', token['token-type']
      header 'uid', token['uid']
    end

    get '/stops' do
      it 'index - list stops' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/stops/:id' do
      it 'show - show stop' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    get '/stops/:id/courses' do
      it 'show - show stop courses' do
        do_request id: stop.id
        expect(status).to be 200
      end
    end

    context 'post - create new stop' do
      post '/stops' do
        it 'validation failed - didnt send name' do
          do_request
          expect(status).to be 422
        end
      end

      post '/stops' do
        it 'validation fail - name too short' do
          do_request name: 'aaaa'
          expect(status).to be 422
        end
      end

      post '/stops' do
        it 'validation pass - name too short' do
          do_request name: 'aaaaa'
          expect(status).to be 201
        end
      end
    end

    context 'put - update existing stop' do
      put '/stops/:id' do
        it 'validation failed - name too short' do
          do_request id: stop.id, name: 'aaaa'
          expect(status).to be 422
        end
      end

      put '/stops/:id' do
        it 'validation pass' do
          do_request id: stop.id, name: 'aaaaa'
          expect(status).to be 204
        end
      end
    end

    delete '/stops/:id' do
      it 'delete - delete stop' do
        do_request id: stop.id
        expect(status).to be 204
      end
    end
  end
end


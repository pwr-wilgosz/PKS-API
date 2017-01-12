require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Courses' do
  let(:course) { create :course, name: 'aaaaa', stops: [create(:stop, name: 'aaaaa')], buses: [create(:bus)] }
  let(:stop) { course.stops.first }
  let(:bus) { course.buses.first }

  context 'not authorized' do
    get '/courses' do
      it 'course - list courses' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/courses/:id' do
      it 'show - show course' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/stops' do
      it 'show - show course stops' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/buses' do
      it 'show - show course buses' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    post '/courses' do
      it 'post - only authorized' do
        do_request id: course.id
        expect(status).to be 401
      end
    end

    put '/courses/:id' do
      it 'put - only authorized' do
        do_request id: course.id
        expect(status).to be 401
      end
    end

    delete '/courses/:id' do
      it 'delete - only authorized' do
        do_request id: course.id
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

    get '/courses' do
      it 'index - list courses' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/courses/:id' do
      it 'show - show course' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/stops' do
      it 'show - show course stops' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/buses' do
      it 'show - show course buses' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    post '/courses' do
      it 'post - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    put '/courses/:id' do
      it 'put - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    delete '/courses/:id' do
      it 'delete - access denied' do
        do_request id: course.id
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

    get '/courses' do
      it 'index - list courses' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/courses/:id' do
      it 'show - show course' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/stops' do
      it 'show - show course stops' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/buses' do
      it 'show - show course buses' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    post '/courses' do
      it 'post - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    put '/courses/:id' do
      it 'put - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    delete '/courses/:id' do
      it 'delete - access denied' do
        do_request id: course.id
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

    get '/courses' do
      it 'index - list courses' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/courses/:id' do
      it 'show - show course' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/stops' do
      it 'show - show course stops' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/buses' do
      it 'show - show course buses' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    post '/courses' do
      it 'post - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    put '/courses/:id' do
      it 'put - access denied' do
        do_request id: course.id
        expect(status).to be 403
      end
    end

    delete '/courses/:id' do
      it 'delete - access denied' do
        do_request id: course.id
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

    get '/courses' do
      it 'index - list courses' do
        do_request format: :json
        expect(status).to be 200
      end
    end

    get '/courses/:id' do
      it 'show - show course' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/stops' do
      it 'show - show course stops' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    get '/courses/:id/buses' do
      it 'show - show course buses' do
        do_request id: course.id
        expect(status).to be 200
      end
    end

    context 'post - create new course' do
      post '/courses' do
        it 'validation failed - didnt send name' do
          do_request
          expect(status).to be 422
        end
      end

      post '/stops' do
        it 'validation failed - name too short' do
          do_request name: 'aaaa'
          expect(status).to be 422
        end
      end

      post '/stops' do
        it 'validation pass' do
          do_request name: 'aaaaa'
          expect(status).to be 201
        end
      end

    end

    context 'put - update existing course' do
      put '/courses/:id' do
        it 'validation failed - name too short' do
          do_request id: stop.id, name: 'aaaa'
          expect(status).to be 422
        end
      end

      put '/courses/:id' do
        it 'validation pass' do
          do_request id: stop.id, name: 'aaaaa'
          expect(status).to be 204
        end
      end
    end

    delete '/courses/:id' do
      it 'delete - delete course' do
        do_request id: course.id
        expect(status).to be 204
      end
    end

    post '/courses/:id/add_bus/:bus_id' do
      let(:bus_new) { create :bus }

      it 'post - create course bus' do
        expect do
          do_request id: course.id, bus_id: bus_new.id
        end.to change{ course.buses.count }.by(1)

        expect(status).to be 201
      end
    end

    post '/courses/:id/add_stop/:stop_id' do
      let(:stop_new) { create :stop }

      it 'post - create course stop' do
        expect do
          do_request id: course.id, stop_id: stop_new.id
        end.to change{ course.stops.count }.by(1)

        expect(status).to be 201
      end
    end

    delete '/courses/:id/remove_bus/:bus_id' do
      it 'delete - delete course bus' do
        expect do
          do_request id: course.id, bus_id: bus.id
        end.to change{ course.buses.count }.by(-1)

        expect(status).to be 204
      end
    end

    delete '/courses/:id/remove_stop/:stop_id' do
      it 'delete - delete course stop' do
        expect do
          do_request id: course.id, stop_id: stop.id
        end.to change{ course.stops.count }.by(-1)

        expect(status).to be 204
      end
    end
  end
end


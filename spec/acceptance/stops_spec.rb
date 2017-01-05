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
end


require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Buses' do
  get '/buses' do
    it 'should list available busses' do
      create :bus
      do_request format: :json
      expect(status).to be 200
    end
  end
end


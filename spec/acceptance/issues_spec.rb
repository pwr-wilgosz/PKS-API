require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Issues' do
  get '/issues' do
    it 'should list available issues' do
      create :issue
      do_request format: :json
      expect(status).to be 200
    end
  end
end


# frozen_string_literal: true
#
# ENV['APP_ENV'] = 'test'
#
# require 'config'
# require 'rspec'
require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe Application do
  let(:app) { Application.new }

  context "get to /ruby/monstas" do
    let(:response) { get "/ruby/monstas" }
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to include "/ruby/monstas, using GET" }
  end

  context "post to /" do
    let(:response) { post "/" }
    it { expect(response.status).to eq 405 }
    it { expect(response.body).to eq "Method not allowed: POST" }
  end
end

#!/usr/bin/env duct # ruby
# see https://github.com/porras/duct

require 'sinatra'
require 'sinatra/json'
require 'faker'

get '/tracks' do
  after = (params[:after] || 1).to_i
  srand after

  tracks = ((after + 1)..(after + 10)).map do |i|
    { id: i, duration: rand(4 * 60), title: Faker::Commerce.department, artist: Faker::Name.name }
  end

  json tracks: tracks, meta: { next: "#{request.scheme}://#{request.host_with_port}/tracks?after=#{after + 10 }" }
end

__END__

@@ Gemfile

source 'https://rubygems.org'

gem 'faker'
gem 'sinatra'
gem 'sinatra-contrib'

@@ Gemfile.lock
GEM
  remote: https://rubygems.org/
  specs:
    backports (3.6.4)
    faker (1.4.3)
      i18n (~> 0.5)
    i18n (0.7.0)
    multi_json (1.11.1)
    rack (1.6.4)
    rack-protection (1.5.3)
      rack
    rack-test (0.6.3)
      rack (>= 1.0)
    sinatra (1.4.6)
      rack (~> 1.4)
      rack-protection (~> 1.4)
      tilt (>= 1.3, < 3)
    sinatra-contrib (1.4.4)
      backports (>= 2.0)
      multi_json
      rack-protection
      rack-test
      sinatra (~> 1.4.0)
      tilt (>= 1.3, < 3)
    tilt (2.0.1)

PLATFORMS
  ruby

DEPENDENCIES
  faker
  sinatra
  sinatra-contrib

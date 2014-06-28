require 'sinatra'
require 'json'

get '/' do
  "Nothing Here - Go Home"
end

post '/' do
  data = JSON.parse(params['payload'])
  if ENV['branch'].split(',').include? data['commits'].first['branch']
    uri = URI("https://www.codeship.io/hook/#{ENV['project_uuid']}")
    Net::HTTP.post_form(uri, params)
  end
end

require 'sinatra'
require 'json'

get '/' do
  "Nothing Here - Go Home"
end

post '/' do
  data = JSON.parse(params['payload'])
  if data['commits'].first['branch'] == ENV['branch']
    uri = URI("https://www.codeship.io/hook/#{ENV['project_uuid']}")
    Net::HTTP.post_form(uri, params)
  end
end

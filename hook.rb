require 'sinatra'

get '/' do
  "Nothing Here - Go Home"
end

post '/' do
  puts params.inspect
  if params[:commits][0][:branch] == ENV['branch']
    uri = URI("https://www.codeship.io/hook/ENV['project_uuid']")
    Net::HTTP.post_form(uri, params)
  else
    ""
  end
end

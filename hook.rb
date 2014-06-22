require 'sinatra'
require "logger"

configure do
  LOG = Logger.new(STDOUT)
  LOG.level = Logger.const_get ENV['LOG_LEVEL'] || 'DEBUG'

  LOG.info 'I am logging something.'
end

get '/' do
  "Nothing Here - Go Home"
end

post '/' do
  LOG.debug params

  uri = URI("https://www.codeship.io/hook/ENV['project_uuid']")
  Net::HTTP.post_form(uri, params)
end

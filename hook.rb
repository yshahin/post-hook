require 'sinatra'

get '/' do
  "Nothing Here - Go Home"
end

post '/' do
  puts "=================================================="
  params.each do |k, v|
    puts "#{k} => #{v}"
  end
  puts "=================================================="
end

require 'sinatra'

post '/' do
  puts "=================================================="
  params.each do |k, v|
    puts "#{k} => #{v}"
  end
  puts "=================================================="
end

require 'rubygems'
require 'sinatra';

get '/' do
  'Hello World!'
end

get '/foo' do
  'you said foo'
end

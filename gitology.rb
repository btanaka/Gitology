require 'rubygems'
require 'sinatra';

TITLE = "Gitology - A wealth of knowledge about Git"

get '/' do
  haml :index
end


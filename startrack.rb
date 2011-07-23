#!/usr/bin/env ruby
# startrack.rb - convenience script for starting local app

%x[rackup config.ru --port=4567]


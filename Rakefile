#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

begin
  require 'thinking_sphinx/tasks'
rescue LoadError
  puts "You can't load Thinking Sphinx tasks unless the thinking-sphinx gem is installed."
end

Dj::Application.load_tasks

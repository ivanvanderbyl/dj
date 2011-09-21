module Dj
  class CLI < Thor
    namespace 'dj'

    desc 'start', 'Start looking for servers'
    def start
      Dj::Browser.new
    end

  end
end
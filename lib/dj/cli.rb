module DJ
  class CLI < Thor
    namespace 'dj'

    desc 'start', 'Start looking for servers'
    def start
      DJ::Browser.new
    end

  end
end
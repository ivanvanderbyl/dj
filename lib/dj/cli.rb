module DJ
  class CLI < Thor
    namespace 'dj'

    desc 'start', 'Start looking for servers'
    def start
      puts "Starting..."
    end

  end
end
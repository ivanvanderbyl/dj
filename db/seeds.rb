server = Server.create!(:hostname => 'workpony.local', :online => true)

server.songs.create! :name => 'Running Battle - Kasabian', :url => 'http://0.0.0.0:1337/tracks/530'

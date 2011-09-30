class Library < ActiveRecord::Base
  has_many :tracks, :dependent => :destroy
  has_many :songs, :through => :tracks

  def self.create_or_update_from_dnssd_service(service)
    library = find_or_create_by_name(service.name)

    if service.flags.add?
      DNSSD::Service.new.resolve service do |r|
        # puts service.domain
        uri = URI.parse("http://#{r.target}:#{r.port}")
        puts uri.host

        if uri.host =~ /\.local\.?$/
          library.update_attribute(:url, uri.to_s)
          
          library.update_attribute(:online, true)
          library.import
        end
        break unless r.flags.more_coming?
      end
    else
      library.update_attribute(:online, false)
    end
  end

  def load_json
    json = RestClient.get(self.url)
    JSON.load(json)
  end

  def import
    print "Importing library from #{url}..."
    library_hash = load_json
    tracks_array = library_hash['tracks'].map { |track|
      track = sanitize_keys(track)
      track.symbolize_keys!
      track = track.slice(*TrackHash.translations)
      TrackHash.new(track)
    }

    tracks_array.each do |track_hashie|
      track = tracks.find_or_create_by_persistent_id(track_hashie.persistent_id)
      track.attributes = track_hashie.to_hash.symbolize_keys.slice(:guid, :bit_rate)

      track.song = Song.find_or_create_by_name(track_hashie.name, track_hashie.to_hash.symbolize_keys.slice(:artist, :album, :year, :duration))
      track.save!
    end

    puts "Done. Imported #{tracks.count} tracks."
  rescue Errno::ETIMEDOUT => e
    puts "ERROR: Connection timed out"
    update_attribute(:online, false)
  end

  def online?
    online.eql?(true)
  end

  private

  def sanitize_keys(hash)
    result = {}
    hash.each { |key, value|
      result[key.to_s.gsub(/ /, '_')] = value
    }
    result
  end
end

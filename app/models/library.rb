class Library < ActiveRecord::Base
  has_many :tracks, :dependent => :destroy
  has_many :songs, :through => :tracks

  def self.create_or_update_from_dnssd_service(service)
    library = find_or_create_by_name(service.name)

    if service.flags.add?
      DNSSD::Service.new.resolve service do |r|
        if r.domain == 'local'
          library.update_attribute(:url, url_for_hostname(r.target, r.port))
        end
        break unless r.flags.more_coming?
      end

      library.update_attribute(:online, true)
      library.import
    else
      library.update_attribute(:online, false)
    end
  end

  def self.url_for_hostname(hostname, port)
    "http://#{hostname}:#{port}"
  end

  def load_json
    json = RestClient.get(self.url)
    JSON.load(json)
  end

  def import
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

    puts "Imported #{tracks.count} tracks from #{url}"
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

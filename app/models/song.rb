class Song < ActiveRecord::Base
  has_many :tracks
  has_many :libraries, :through => :tracks

  def to_s
    "#{artist} [#{album}] - #{name}"
  end

  define_index do
    indexes name, :sortable => true
    indexes artist, :sortable => true
    indexes album, :sortable => true
  end

  def download
    transfer_file
  end

  def transfer_file(&block)
    url = URI.parse(song_url)
    resp = Net::HTTP.start(url.host, url.port) { |http| http.get(url.path) }
    file = File.new(Rails.root.join('tmp', id.to_s), "w+")
    file.write resp.body.force_encoding("UTF-8")
    yield file if block_given?
    file.close
  end

  def song_url
    locate_best_track.url
  end

  def locate_best_track
    tracks.sort { |a,b| b <=> a }.find { |track|
      track.library.online?
    }
  end

  def as_json(options = nil)
    super if options.present?

    {
      :id => id,
      :label => name,
      :artist => artist,
      :value => id,
      :album => album
    }
  end

end

class Request < ActiveRecord::Base
  belongs_to :song

  def self.find_or_create_for_song(song)
    create(:song => song)
  end

  def as_json(options = nil)
    {
      :song => song.attributes,
      :id => id
    }
  end
end

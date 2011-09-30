class Request < ActiveRecord::Base
  belongs_to :song

  def self.find_or_create_for_song(song)
    create(:song => song)
  end
end

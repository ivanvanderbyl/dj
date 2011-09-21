class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :library

  def url
    uri = URI.parse(library.url)
    uri.path = "/tracks/#{guid}/download"
    uri.to_s
  end
end

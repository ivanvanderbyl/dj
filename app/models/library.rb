class Library < ActiveRecord::Base
  has_many :tracks
  has_many :songs, :throught => :tracks
end

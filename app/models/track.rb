class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :library

  
end

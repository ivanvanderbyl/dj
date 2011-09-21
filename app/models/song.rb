class Song < ActiveRecord::Base
  has_many :tracks
  has_many :libraries, :through => :tracks

  def to_s
    "#{artist} [#{album}] - #{name}"
  end

end

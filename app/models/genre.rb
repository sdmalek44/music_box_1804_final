class Genre < ApplicationRecord
  has_many :song_genres
  has_many :songs, through: :song_genres

  def average_rating
    songs.average(:rating)
  end

  def lowest_rated
    songs.order(rating: :asc).first
  end

  def highest_rated
    songs.order(rating: :desc).first
  end
end

require 'rails_helper'

describe Genre, type: :model do
  before :each do
    @artist = Artist.create(name: 'Journey')
    @genre1 = Genre.create!(name: 'blues')
    @song1 = @genre1.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, artist_id: @artist.id, rating: 1)
    @song2 = @genre1.songs.create!(title: "Anyway You Want It", length: 420, play_count: 67908, artist_id: @artist.id, rating: 3)
    @song3 = Song.create!(title: "Anyway You Want It", length: 420, play_count: 67908, artist_id: @artist.id, rating: 5)
  end
  it 'calculates average song rating for all in genre' do
    expect(@genre1.average_rating).to eq(2)
  end
  it 'calculates lowest song rating' do
    expect(@genre1.lowest_rated).to eq(@song1)
  end
  it 'calculates highest song rating' do
    expect(@genre1.highest_rated).to eq(@song2)
  end
end

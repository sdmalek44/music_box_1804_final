require 'rails_helper'

describe Song, type: :model do
  before :each do
    @artist = Artist.create(name: 'Journey')
    @genre1 = Genre.create!(name: 'blues')
    @song1 = @genre1.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, artist_id: @artist.id, rating: 1)
    @song2 = @genre1.songs.create!(title: "derpy derp derp", length: 420, play_count: 67908, artist_id: @artist.id, rating: 1)
    @song3 = Song.create!(title: "Anyway You Want It", length: 420, play_count: 67908, artist_id: @artist.id, rating: 1)
    @song4 = Song.create!(title: "billly", length: 420, play_count: 67908, artist_id: @artist.id, rating: 1)
    @song5 = Song.create!(title: "dancing", length: 420, play_count: 67908, artist_id: @artist.id, rating: 4)
  end
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
  end

  describe 'relationships' do
    it{should belong_to(:artist)}
  end

  xit 'can find other songs wit the same rating' do
    expect(@song1.similar_rated).to eq([@song2, @song3, @song4])
  end
end

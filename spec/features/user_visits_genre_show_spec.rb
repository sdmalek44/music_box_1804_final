require 'rails_helper'

describe 'user visits /genres/#' do
  before :each do
    @artist = Artist.create(name: 'Journey')
    @genre1 = Genre.create!(name: 'blues')
    @genre2 = Genre.create!(name: 'rock')
    @genre3 = Genre.create!(name: 'classic')
    @song1 = @genre1.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, artist_id: @artist.id, rating: 1)
    @song2 = @genre1.songs.create!(title: "Anyway You Want It", length: 420, play_count: 67908, artist_id: @artist.id, rating: 3)
    @song3 = @genre2.songs.create!(title: "blah blah blah", length: 420, play_count: 67908, artist_id: @artist.id, rating: 4)

    @admin = User.create!(username: 'bob', password: 'tacos', role: 1)
  end
  it 'user can see all songs in genre' do
    visit genre_path(@genre1)

    expect(page).to have_content(@song1.title)
    expect(page).to have_content(@song1.length)
    expect(page).to have_content(@song1.play_count)
    expect(page).to have_content(@song2.title)
    expect(page).to have_content(@song2.length)
    expect(page).to have_content(@song2.play_count)
    expect(page).to_not have_content(@song3.title)
  end
  it 'can see average rating of songs' do
    visit genre_path(@genre1)

    expect(page).to have_content("Average Song Rating:", @genre1.average_rating)
  end
end

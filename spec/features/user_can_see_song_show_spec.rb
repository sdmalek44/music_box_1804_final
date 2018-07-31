require 'rails_helper'

describe 'user sees one song' do
  before :each do
    @artist = Artist.create(name: 'Journey')
    @song1 = Song.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, artist_id: @artist.id, rating: 4)
    @genre1 = @song1.genres.create!(name: 'blues')
    @genre2 = @song1.genres.create!(name: 'rock')
    @genre3 = @song1.genres.create!(name: 'classic')
    @genre4 = Genre.create!(name: 'death metal')

    @admin = User.create!(username: 'bob', password: 'tacos', role: 1)
  end
  it 'with title and length' do
    artist = Artist.create(name: 'Journey')
    song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
    song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

    visit song_path(song_1)

    expect(current_path).to eq("/songs/#{song_1.slug}")

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to_not have_content(song_2.title)
    expect(page).to_not have_content(song_2.length)
  end
  it 'can see rating for song' do
    visit song_path(@song1)

    expect(page).to have_content(@song1.rating)
  end
  it 'can see all associated genres' do
    visit song_path(@song1)
    
    expect(page).to have_content("Genres for this song:")
    expect(page).to have_content(@genre1.name)
    expect(page).to have_content(@genre2.name)
    expect(page).to have_content(@genre3.name)
    expect(page).to_not have_content(@genre4.name)
  end
end

require 'rails_helper'

describe 'user visits /genres' do
  before :each do
    @artist = Artist.create(name: 'Journey')

    @song_1 = @artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
    @song_2 = @artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

    @genre1 = Genre.create!(name: 'blues')
    @genre2 = Genre.create!(name: 'rock')
    @genre3 = Genre.create!(name: 'classic')
    @admin = User.create!(username: 'bob', password: 'tacos', role: 1)
  end
  it 'can  see all genres' do
    visit genres_path

    expect(page).to have_content(@genre1.name)
    expect(page).to have_content(@genre2.name)
    expect(page).to have_content(@genre3.name)
  end
  it 'can create new genre if admin' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit genres_path

    fill_in :genre_name, with: 'metal'
    click_on "Create Genre"

    expect(current_path).to eq(genres_path)
    expect(page).to have_content('metal')
    expect(page).to have_content(@genre1.name)
    expect(page).to have_content(@genre2.name)
    expect(page).to have_content(@genre3.name)
  end
end

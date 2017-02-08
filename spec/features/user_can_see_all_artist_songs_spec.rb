require_relative '../rails_helper'

RSpec.feature "User clicks on a link on artist page" do
  scenario "and is able to see all the songs for that artist" do
    artist = create(:artist)
    artist.songs.create(title: "song1")
    artist.songs.create(title: "song2")
    artist.songs.create(title: "song3")

    visit(artist_path(artist))
    click_on("View Songs")

    expect page.has_content?('song1')
    expect page.has_content?('song2')
    expect page.has_content?('song3')
    expect page.has_link?('song1', href: song_path(Song.find_by(title: 'song1')))
    expect page.has_link?('song2', href: song_path(Song.find_by(title: 'song2')))
    expect page.has_link?('song3', href: song_path(Song.find_by(title: 'song3')))
  end
end

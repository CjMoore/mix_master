require_relative '../rails_helper'

RSpec.feature "User fills out a form" do
  scenario "and they are able to see the page for that playlist" do
    song_one, song_two, song_three = create_list(:song, 3)

    playlist_name = "My Jams"

    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name
    check("Song-#{song_one.id}")
    check("Song-#{song_three.id}")
    click_on("Create Playlist")

    expect page.has_content?(playlist_name)

    within("li:first") do
      expect page.has_link?(song_one.title, href: song_path(song_one))
    end

    within("li:last") do
      expect page.has_link?(song_three.title, href: song_path(song_three))
    end
  end
end

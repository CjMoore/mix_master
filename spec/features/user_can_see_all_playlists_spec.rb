require_relative '../rails_helper'

RSpec.feature "When user visits playlist index" do
  scenario "they can see all present playlists" do
    song_1 = Song.create(title: "Yup")
    song_2 = Song.create(title: "Sure")
    song_3 = Song.create(title: "Uh")


    playlist = Playlist.create(name: "Jamz", song_ids: [song_1.id, song_2.id, song_3.id])

    playlist2 = Playlist.create(name: "Jammin", song_ids: [song_1.id, song_2.id, song_3.id])

    visit(playlists_path)

    expect page.has_content?("Jamz")
    expect page.has_link?(playlist.name, href: playlist_path(playlist))

    expect page.has_content?("Jammin")
    expect page.has_link?(playlist2.name, href: playlist_path(playlist2))

  end
end

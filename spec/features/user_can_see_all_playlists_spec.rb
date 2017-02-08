require_relative '../rails_helper'
require 'pry'

RSpec.feature "When user visits playlist index" do
  scenario "they can see all present playlists" do
    song_1, song_2 = create_list(:song, 2)
    playlist = create(:playlist, song_ids: [song_1.id, song_2.id])
    playlist2 = create(:playlist, song_ids: [song_1.id, song_2.id])

    visit(playlists_path)

    expect page.has_content?("Jamz")
    expect page.has_link?(playlist.name, href: playlist_path(playlist))

    expect page.has_content?("Jammin")
    expect page.has_link?(playlist2.name, href: playlist_path(playlist2))

  end
end

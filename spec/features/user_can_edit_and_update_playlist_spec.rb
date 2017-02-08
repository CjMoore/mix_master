require_relative '../rails_helper'

RSpec.feature "When a user edits a playlist" do
  scenario "they are able to see updated attributes on playlist show" do
    song_1, song_2, song_3 = create_list(:song, 3)

    playlist = create(:playlist, name: "Jamz", song_ids: [song_1.id, song_2.id])

    visit(edit_playlist_path(playlist))
    check("Song-#{song_2.id}")
    check("Song-#{song_3.id}")
    fill_in('playlist_name', :with => "Jammin")

    click_on("Update Playlist")

    expect page.has_content?("Uh")
    expect page.has_no_content?("Sure")
    expect page.has_content?("Jammin")
    expect page.has_no_link?(song_2.title, href: song_path(song_2))
    expect page.has_link?(song_3.title, href: song_path(song_3))
  end
end

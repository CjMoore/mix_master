require_relative '../rails_helper'

describe "User fills out a form" do
  scenario "and is able to add a new song to the database" do
    artist = create(:artist)

    song_title = "One Love"

    visit(artist_path(artist))

    click_on "New Song"
    fill_in("song_title", with: song_title)
    click_on("Create Song")

    expect page.has_content?(song_title)
    expect page.has_link?(artist.name, href: artist_path(artist))
  end
end

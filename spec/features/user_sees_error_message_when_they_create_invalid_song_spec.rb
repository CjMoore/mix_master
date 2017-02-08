require_relative '../rails_helper'

describe "When user makes a new song" do
  it "with an invalid title they see an error message" do
    artist = create(:artist)
    visit(new_artist_song_path(artist))

    click_on "Create Song"

    expect page.has_content?("1 error prohibited this record from being saved:")
    expect page.has_content?("Title can't be blank")
  end
end

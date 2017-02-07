require_relative '../rails_helper'

describe "When a user is on the show page of an artist" do
  scenario "they can click edit and fill out a form and change an artists attributes" do
    marley_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    sinbad_path = "https://pbs.twimg.com/profile_images/477764918326743040/q8_9xrhm.png"
    artist = Artist.create(name: "Sinbad", image_path: sinbad_path)

    visit(artist_path(artist))

    click_on("Edit")

    expect page.has_current_path?(edit_artist_path(artist))

    fill_in "artist_name", with: "Bob Marley"
    fill_in "artist_image_path", with: marley_path
    click_on "Update Artist"


    expect page.has_current_path?(artist_path(artist))
    expect page.has_content?("Bob Marley")
    expect page.has_css?("img[src=\"#{marley_path}\"]")
  end
end

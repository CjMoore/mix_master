require_relative '../rails_helper'

describe "When user visits show page for artist" do
  scenario "they are able to click delete which will remove them from the database" do
    marley_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    sinbad_path = "https://pbs.twimg.com/profile_images/477764918326743040/q8_9xrhm.png"
    artist = Artist.create(name: "Bob Marley", image_path: marley_path)
    Artist.create(name: "Sinbad", image_path: sinbad_path)

    visit(artist_path(artist))

    click_on("Delete")

    expect page.has_current_path?(artists_path)
    expect page.has_content?("Sinbad")
    expect page.has_no_content?("Bob Marley")
  end
end

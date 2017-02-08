require_relative '../rails_helper'

describe "When user visits artist index" do
  scenario "They are able to see all artists in database" do
    marley_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    sinbad_path = "https://pbs.twimg.com/profile_images/477764918326743040/q8_9xrhm.png"

    artist1 = create(:artist, name: "Bob Marley", image_path: marley_path)
    artist2 = create(:artist, name: "Sinbad", image_path: sinbad_path)

    visit(artists_path)

    expect page.has_content?("Bob Marley")
    expect page.has_content?("Sinbad")
    expect page.has_css?("img[src=\"#{marley_path}\"]")
    expect page.has_css?("img[src=\"#{sinbad_path}\"]")
  end
end

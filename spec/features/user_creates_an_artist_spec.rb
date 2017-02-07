require_relative '../rails_helper'

describe "User fills out a form" do
  scenario "and submits a new artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit(artists_path)

    click_on("New Artist")

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect page.has_content?(artist_name)
    expect page.has_css?("img[src=\"#{artist_image_path}\"]")
  end
end

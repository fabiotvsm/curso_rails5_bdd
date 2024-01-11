require "rails_helper"

RSpec.feature "Create Article" do
    scenario "A user creates a new article" do 
        visit "/"

        click_link "New Article"

        fill_in "Title", with:"Test One"
        fill_in "Body", with:"Something Something"

        click_button "Create Article"

        expect(page).to have_content("The article has been created")
        expect(page.current_path).to eq(articles_path)
    end
end
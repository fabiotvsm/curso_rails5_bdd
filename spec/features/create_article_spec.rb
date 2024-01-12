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

    scenario "The user fails to create a article" do
        visit "/"

        click_link "New Article"

        fill_in "Title", with:""
        fill_in "Body", with:""


        click_button "Create Article"

        expect(page).to have_content("Article has not been created")
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Body can't be blank")
        # expect(page.current_path).to eq(articles_path)

    end
  
end
require "rails_helper"

RSpec.feature "Editing Articles" do

    before do
        john = User.create!(email: "john@example.com", password:"password")
        login_as(john)
        @article = Article.create(title: "Primeiro artigo", body: "Something something.", user: john)
    end

    scenario "A user updates an articles" do
        visit "/"

        click_link @article.title
        click_link "Edit Article"

        fill_in "Title", with: "Artigo editado"
        fill_in "Body", with: "Something diferent"

        click_button "Update Article"

        expect(page).to have_content("Article has been updated")
        expect(page.current_path).to eq(article_path(@article)) 

    end

end
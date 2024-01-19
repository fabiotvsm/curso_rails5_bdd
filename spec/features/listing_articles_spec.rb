require "rails_helper"

RSpec.feature "Listing Articles" do

    before do
        john = User.create!(email: "john@example.com", password:"password")

        @article1 = Article.create(title: "Primeiro artigo", body: "Something something.", user: john)

        @article2 = Article.create(title: "Segundo artigo", body: "Something different.", user: john)

    end

    scenario "A user lists all articles" do
        visit "/"

        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)

    end

end
     
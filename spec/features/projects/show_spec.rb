require 'rails_helper'

RSpec.describe "Project Show Page", type: :feature do
    it "can see the project's name, material, nand theme" do

        challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        project = challenge.projects.create(name: "Litfit", material: "Lamp")
        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        ContestantProject.create(contestant_id: jay.id, project_id: project.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: project.id)



        visit("/projects/#{project.id}")

        expect(page).to have_content("#{project.name}")
        expect(page).to have_content("#{project.material}")
        expect(page).to have_content("#{project.challenge.theme}")
    end
end
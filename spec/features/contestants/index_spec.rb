require 'rails_helper'

RSpec.describe "Contestants index page", type: :feature do
    it "can see the contestants' names and projects" do

        challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        challenge2 = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        project = challenge.projects.create(name: "Litfit", material: "Lamp")
        project2 = challenge2.projects.create(name: "Neat", material: "Rug")

        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: jay.id, project_id: project.id)
        ContestantProject.create(contestant_id: jay.id, project_id: project2.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: project.id)

        visit("/contestants")
        within(".contestant-#{jay.id}") do
            expect(page).to have_content("#{jay.name}")
            expect(page).to have_content("Projects: #{project.name}, #{project2.name}")
        end

        within(".contestant-#{gretchen.id}") do
            expect(page).to have_content("#{gretchen.name}")
            expect(page).to have_content("Projects: #{project.name}")
        end
    end
end
require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  it "can get number of contestants" do
    challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    project = challenge.projects.create(name: "Litfit", material: "Lamp")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    chris = Contestant.create(name: "chris Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: jay.id, project_id: project.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: project.id)
    ContestantProject.create(contestant_id: chris.id, project_id: project.id)

    expect(project.number_of_contestants).to eq(3)
  end
end

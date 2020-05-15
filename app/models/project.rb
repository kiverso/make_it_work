class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def number_of_contestants
    contestants.length
  end

  def average_contestant_experience
    contestants.average(:years_of_experience).truncate(6).to_f
  end
end

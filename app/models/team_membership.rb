class TeamMembership < ActiveRecord::Base
  belongs_to :employee
  belongs_to :team
  # attr_accessible :title, :body
  validates :employee, :team, :presence => :true
  validates :employee_id, :uniqueness => {:scope => :team_id}
end

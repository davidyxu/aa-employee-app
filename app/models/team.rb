class Team < ActiveRecord::Base
  attr_accessible :name, :supervisor_id, :employee_ids

  belongs_to :supervisor, :class_name => 'Employee',
  												:inverse_of => :supervised_teams

  has_many :memberships, :class_name => 'TeamMembership',
  												:inverse_of => :team
  has_many :employees, :through => :memberships

  validates :name, :presence => :true
end

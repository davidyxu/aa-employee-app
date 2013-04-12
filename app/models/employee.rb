class Employee < ActiveRecord::Base
  attr_accessible :supervisor_id, :name, :employee_profile_attributes, :team_ids

  has_many :supervised_teams, :class_name => 'Team',
		  												:foreign_key => :supervisor_id,
  														:inverse_of => :supervisor
  belongs_to :supervisor, :class_name => 'Employee',
  												:inverse_of => :subordinates
  has_many :subordinates, :class_name => 'Employee',
  												:foreign_key => :supervisor_id,
  												:inverse_of => :supervisor
  has_one :employee_profile, :inverse_of => :employee, :dependent => :destroy
  accepts_nested_attributes_for :employee_profile
  has_many :memberships, :class_name => 'TeamMembership',
  												:inverse_of => :employee
  has_many :teams, :through => :memberships

  validates :name, :presence => true

  def not_present(attribute)
    if attribute[:description].empty? || attribute[:description].nil?
      return true if attribute[:title].empty? || attribute[:title].nil?
    end
    false
  end
end

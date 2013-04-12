class EmployeeProfile < ActiveRecord::Base
	include ActionView::Helpers::TextHelper
  attr_accessible :description, :title, :employee_id, :dob, :day, :salary, :food, :height, :avatar
  has_attached_file :avatar

  belongs_to :employee, :inverse_of => :employee_profile

  validates :employee, :presence => true
  validates_inclusion_of :day, :in => ["M", "T", "W", "R", "F", "S", "U"], :allow_blank => true

  def day_in_words
  	case day
  	when "M" then "Monday"
  	when "T" then "Tuesday"
  	when "W" then "Wednesday"
  	when "R" then "Thursday"
  	when "F" then "Friday"
  	when "S" then "Saturday"
  	when "U" then "Sunday"
  	end
  end

  def height_in_words
  	feet = height/12
  	inches = height%12
  	height_in_words = "#{feet} feet"
  	height_in_words += " and #{pluralize(inches, 'inch')} " if inches != 0
  	height_in_words
  end 

  def age
	  now = Date.today
	  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end
end

class ChangesToEmployeeProfile < ActiveRecord::Migration
  def change
  	remove_column :employee_profiles, :name
  	add_column :employee_profiles, :description, :text
  end
end

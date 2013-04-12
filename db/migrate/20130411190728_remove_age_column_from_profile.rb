class RemoveAgeColumnFromProfile < ActiveRecord::Migration
  def change
  	remove_column :employee_profiles, :age
  end
end

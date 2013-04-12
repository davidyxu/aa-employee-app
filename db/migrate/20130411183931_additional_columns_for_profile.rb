class AdditionalColumnsForProfile < ActiveRecord::Migration
  def change
  	change_table :employee_profiles do |t|
  		t.integer :height
  		t.integer :age
  		t.string :food
  		t.string :day
  		t.date :dob
  		t.integer :salary
  	end
  end
end

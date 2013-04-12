class CreateEmployeeProfiles < ActiveRecord::Migration
  def change
    create_table :employee_profiles do |t|
      t.references :employee
      t.string :name
      t.string :title

      t.timestamps
    end
    add_index :employee_profiles, :employee_id
  end
end

class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :supervisor_id

      t.timestamps
    end
    add_index :employees, :supervisor_id
  end
end

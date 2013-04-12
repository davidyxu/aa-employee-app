class AddPaperClipColumnToEmployee < ActiveRecord::Migration
  def up
  	add_attachment :employee_profiles, :avatar
	end

	def down
  	remove_attachment :employee_profiles, :avatar
	end
end

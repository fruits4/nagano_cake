class ChangeIsActiveOfGenres < ActiveRecord::Migration[5.2]
  def change
  	def up
  		change_column :is_active, default: true, null: false
  	end

  	def down
  		change_column :is_active
  	end
  end
end

class ChangeNameOfGenres < ActiveRecord::Migration[5.2]
  def change
  	def up
  		change_column :name, null: false
  	end

  	def down
  		change_column :name
  	end
  end
end

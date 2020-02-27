class AddFavouritesAndStudioUsername < ActiveRecord::Migration[5.1]
	def change
		create_table :user_trainers  do |t|
			t.integer :user_id, index: true
			t.integer :trainer_id, index: true
			t.timestamps
		end

		create_table :trainer_studios do |t|
			t.integer :trainer_id, index: true
			t.integer :studio_id, index: true
			t.timestamps
		end

		add_column :studios, :username, :string
		change_column :user_studios, :user_id, :integer
		change_column :user_studios, :studio_id, :integer
	end
end

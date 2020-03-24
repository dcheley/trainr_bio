class AddingBioOffersAndCategories < ActiveRecord::Migration[5.1]
  def change
		create_table :practice_categories  do |t|
			t.string :name
		end

    create_table :specialty_categories  do |t|
			t.string :name
		end

    create_table :milestones  do |t|
      t.integer :trainer_id
      t.string  :milestone
      t.integer :month
      t.integer :year
    end

    create_table :user_practice_categories  do |t|
      t.integer :user_id, index: true
      t.integer :practice_category_id, index: true
    end

    create_table :user_specialty_categories  do |t|
      t.integer :user_id, index: true
      t.integer :specialty_category_id, index: true
    end

		add_column :users,  :headline, :string
    add_column :offers, :cover_img_url, :string
    add_column :offers, :category, :string
    add_column :users,  :bio, :text
    add_column :offers, :expectations, :text
    add_column :offers, :highlights, :text
	end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone
      t.string :location
      t.string :first_name
      t.string :last_name
      t.string :img_url
      t.string :instagram_url
      t.string :facebook_url
      t.string :website_url
      t.string :tik_tok_url
      t.text :description
      t.integer :role
      t.timestamps
    end

    create_table :studios do |t|
      t.string :name
      t.string :location
      t.string :phone
      t.string :img_url
      t.string :website_url
      t.timestamps
    end

    create_table :user_studios do |t|
      t.references :user
      t.references :studio
      t.timestamps
    end
  end
end

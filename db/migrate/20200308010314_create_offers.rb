class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :location
      t.string :booking_url
      t.string :other
      t.text :description
      t.time :start_time
      t.date :date
      t.integer :duration
      t.integer :status
      t.integer :cost
      t.integer :trainer_id, index: true
      t.timestamps
    end
  end
end

class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.time :start_time
      t.date :date
      t.integer :duration
      t.integer :recurring, default: 0
      t.integer :trainer_id, index: true
      t.integer :trainee_id, index: true
      t.timestamps
    end
  end
end

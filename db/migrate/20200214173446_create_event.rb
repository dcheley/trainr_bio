class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :trainer_id, index: true
      t.integer :trainee_id, index: true
      t.timestamps
    end
  end
end

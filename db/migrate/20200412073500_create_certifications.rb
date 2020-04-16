class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
	t.integer :trainer_id, index: true
	t.string :name
	t.string :level
	t.string :accreditor
	t.string :website_url
	t.string :description
	t.date :start_date
	t.date :end_date
    end
  end
end

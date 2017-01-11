class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :telephone
      t.string :email
      t.string :subject
      t.string :person_type
      t.string :research_use
      t.decimal :time_spend
      t.string :au_chog
      t.boolean :complete
      t.string :notes

      t.timestamps
    end
  end
end

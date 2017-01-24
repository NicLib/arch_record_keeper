class ChangeDateStructure < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :date_started
    add_column :jobs, :start_date, :date
    add_column :jobs, :end_date, :date
  end
end

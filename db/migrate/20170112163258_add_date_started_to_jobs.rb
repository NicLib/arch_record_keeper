class AddDateStartedToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :date_started, :date
  end
end

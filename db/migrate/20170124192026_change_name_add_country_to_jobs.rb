class ChangeNameAddCountryToJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :name
    add_column :jobs, :first_name, :string
    add_column :jobs, :last_name, :string
    add_column :jobs, :country, :string
  end
end

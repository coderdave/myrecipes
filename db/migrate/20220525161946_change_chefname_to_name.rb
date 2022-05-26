class ChangeChefnameToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :chefs, :chefname, :name
  end
end

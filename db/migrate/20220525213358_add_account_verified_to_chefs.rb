class AddAccountVerifiedToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :account_verified, :boolean, default: false
  end
end

class AddAuthTokenToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :auth_token, :string
  end
end

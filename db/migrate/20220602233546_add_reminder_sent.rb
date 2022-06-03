class AddReminderSent < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :reminder_sent, :integer, default: 0
  end
end

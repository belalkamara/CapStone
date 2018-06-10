class AddDailyMilesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :day, :date
    add_column :users, :miles, :integer
  end
end

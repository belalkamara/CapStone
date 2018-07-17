class RemoveDayFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :day, :date
  end
end

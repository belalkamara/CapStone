class AddDaysToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :days, :integer
  end
end

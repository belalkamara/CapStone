class AddStartDateToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :start_date, :datetime
  end
end

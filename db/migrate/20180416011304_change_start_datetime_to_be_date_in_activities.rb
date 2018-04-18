class ChangeStartDatetimeToBeDateInActivities < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :start_date, :date
  end
end

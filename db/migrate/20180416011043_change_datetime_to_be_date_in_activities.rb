class ChangeDatetimeToBeDateInActivities < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :end_date, :date
  end
end

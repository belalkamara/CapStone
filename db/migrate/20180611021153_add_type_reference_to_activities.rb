class AddTypeReferenceToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :type, foreign_key: true
  end
end

class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :miles
      t.text :image

      t.timestamps
    end
  end
end

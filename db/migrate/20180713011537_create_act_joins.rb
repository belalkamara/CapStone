class CreateActJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :act_joins do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end

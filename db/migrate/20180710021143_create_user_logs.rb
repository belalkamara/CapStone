class CreateUserLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.references :user, foreign_key: true
      t.integer :miles
      t.date :day

      t.timestamps
    end
  end
end

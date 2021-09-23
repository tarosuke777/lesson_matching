class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :teacher, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :reservations, [:start_time, :teacher], unique: true
  end
end

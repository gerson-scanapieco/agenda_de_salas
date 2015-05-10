class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.integer :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :booking, null: false, foreign_key: { to_table: :bookings, on_delete: :cascade }

      t.timestamps
    end
  end
end

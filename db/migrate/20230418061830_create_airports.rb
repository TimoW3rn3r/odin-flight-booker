class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :airport_code, null: false, default: ''
      t.string :airport_name, null: false, default: ''

      t.timestamps
    end
  end
end

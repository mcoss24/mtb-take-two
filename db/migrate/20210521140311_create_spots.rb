class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :location
      t.string :climate
      t.string :geography
      t.boolean :winter
      t.boolean :fall
      t.boolean :spring
      t.boolean :summer
      t.boolean :cross_country
      t.boolean :downhill

      t.timestamps
    end
  end
end

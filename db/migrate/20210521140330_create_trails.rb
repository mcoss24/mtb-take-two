class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :spot_id
      t.string :link

      t.timestamps
    end
  end
end

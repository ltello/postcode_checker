class CreateServableLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :servable_locations do |t|
      t.string :postcode, null: false, index: true

      t.timestamps
    end
  end
end

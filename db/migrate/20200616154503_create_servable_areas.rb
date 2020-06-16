class CreateServableAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :servable_areas do |t|
      t.string :lsoa, null: false, index: true

      t.timestamps
    end
  end
end

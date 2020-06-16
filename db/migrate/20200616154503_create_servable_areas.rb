# frozen_string_literal: true

class CreateServableAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :servable_areas do |t|
      t.string :lsoa, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

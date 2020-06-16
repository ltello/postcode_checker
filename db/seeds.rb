# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def import_whitelist(model_klass, filename)
  whitelist = []
  CSV.foreach(filename, headers: true) do |row|
    whitelist << row.to_h.merge(created_at: Time.current, updated_at: Time.current)
  end
  model_klass.insert_all(whitelist)
end

# These locations are servable by default:
import_whitelist(ServableLocation, 'db/seeds/servable_postcodes.csv')

# These areas are servable by default:
import_whitelist(ServableArea, 'db/seeds/servable_lsoas.csv')


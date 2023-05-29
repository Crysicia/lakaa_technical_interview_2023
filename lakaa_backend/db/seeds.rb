# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

CollectionIndicator.destroy_all
Indicator.destroy_all
Collection.destroy_all

Indicator.create(name: "Number of participants", unit: "peoples", required: true)
Indicator.create(name: "Food weight", unit: "kg", required: true)

4.times do
  new_collection = Collection.new(
    organization_name: Faker::University.name,
    collected_at: Faker::Time.between(from: DateTime.now - 150, to: DateTime.now - 1),
  )
  new_collection.collection_indicators.build(indicator: Indicator.first, value: Faker::Number.between(from: 1, to: 100))
  new_collection.collection_indicators.build(indicator: Indicator.last, value: Faker::Number.between(from: 1, to: 100))
  new_collection.save!
end

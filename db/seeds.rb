# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create([
  {email: "anil@ga.co", password: "123", password_confirmation: "123"},
  {email: "kalina@ga.co", password: "123", password_confirmation: "123"},
  {email: "harry@ga.co", password: "123", password_confirmation: "123"},
  {email: "charles@ga.co", password: "123", password_confirmation: "123"}
])
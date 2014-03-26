# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Item.destroy_all
PriceLog.destroy_all

temp_password = '1234567'
User.create([
  { email: "anil@ga.co",     password: temp_password, password_confirmation: temp_password },
  { email: "kalina@ga.co",   password: temp_password, password_confirmation: temp_password },
  { email: "harry@ga.co",    password: temp_password, password_confirmation: temp_password },
  { email: "charles@ga.co",  password: temp_password, password_confirmation: temp_password }
])


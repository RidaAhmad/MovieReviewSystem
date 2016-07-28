# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:02', unconfirmed_email: nil)
User.create!(email: 'user@gmail.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:06', unconfirmed_email: nil)
User.create!(email: 'user@yahoo.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:08', unconfirmed_email: nil)
User.create!(email: 'user@hotmail.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:04', unconfirmed_email: nil)

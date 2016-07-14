# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Actor.create!(name: 'Morgan Freeman', bio: 'Morgan Freeman is an American actor and narrator. Freeman won an Academy Award in 2005 for Best Supporting Actor and he has received Oscar nominations for his performances in various English movies', gender: 'male')
Actor.create!(name: 'Jesse Eisenberg', bio: 'Jesse Adam Eisenberg is an American actor, author, playwright, and humorist. He made his television debut with the short-lived comedy-drama series Get Real.', gender: 'male')
Actor.create!(name: 'Melanie Laurent', bio: 'Melanie Laurent is a French actress, singer, screenwriter and director. Born in Paris to a Jewish family, she was introduced to acting at the age of sixteen by a French filmmaker.', gender: 'female')
Actor.create!(name: 'Mark Ruffalo', bio: 'Mark Alan Ruffalo is an American actor, director, humanitarian, social activist, and film producer. He made his screen debut in an episode of CBS Summer Playhouse, followed by minor film roles.', gender: 'male')
Actor.create!(name: 'Woody Harrelson', bio: 'Woodrow Tracy Harrelson is an American actor, activist and playwright. He is a two-time Academy Award nominee and has won one Emmy Award out of seven nominations.', gender: 'male')
Actor.create!(name: 'Angelina Jolie', bio: 'Angelina Jolie Pitt is an American actress, filmmaker, and humanitarian. She has received an Academy Award, two Screen Actors Guild Awards, and three Golden Globe Awards.', gender: 'female')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

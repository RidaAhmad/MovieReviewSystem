# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:02', unconfirmed_email: nil)
User.create!(email: 'user@gmail.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:06', unconfirmed_email: nil)
User.create!(email: 'user@yahoo.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:08', unconfirmed_email: nil)
User.create!(email: 'user@hotmail.com', password: 'password', password_confirmation: 'password', confirmed_at: '2016-06-27 10:40:04', unconfirmed_email: nil)
Actor.create!(name: 'Morgan Freeman', bio: 'Morgan Freeman is an American actor and narrator. Freeman won an Academy Award in 2005 for Best Supporting Actor and he has received Oscar nominations for his performances in various English movies', gender: 'male')
Actor.create!(name: 'Jesse Eisenberg', bio: 'Jesse Adam Eisenberg is an American actor, author, playwright, and humorist. He made his television debut with the short-lived comedy-drama series Get Real.', gender: 'male')
Actor.create!(name: 'Melanie Laurent', bio: 'Melanie Laurent is a French actress, singer, screenwriter and director. Born in Paris to a Jewish family, she was introduced to acting at the age of sixteen by a French filmmaker.', gender: 'female')
Actor.create!(name: 'Mark Ruffalo', bio: 'Mark Alan Ruffalo is an American actor, director, humanitarian, social activist, and film producer. He made his screen debut in an episode of CBS Summer Playhouse, followed by minor film roles.', gender: 'male')
Actor.create!(name: 'Woody Harrelson', bio: 'Woodrow Tracy Harrelson is an American actor, activist and playwright. He is a two-time Academy Award nominee and has won one Emmy Award out of seven nominations.', gender: 'male')
Actor.create!(name: 'Angelina Jolie', bio: 'Angelina Jolie Pitt is an American actress, filmmaker, and humanitarian. She has received an Academy Award, two Screen Actors Guild Awards, and three Golden Globe Awards.', gender: 'female')
Actor.create!(name: 'Lauren Cohan', bio: 'Lauren Cohan is a British-American actress and model,best known for her role as Maggie Greene on The Walking Dead .', gender: 'female')
Actor.create!(name: 'Mandy Moore', bio: 'Amanda Leigh Mandy Moore is an American singer-songwriter and actress.', gender: 'female')
Actor.create!(name: 'Shane West', bio: 'Shane West is an American actor, punk rock musician and songwriter.', gender: 'male')
Actor.create!(name: 'Jennifer Aniston', bio: ' Jennifer Joanna Aniston is an American actress, producer, and businesswoman.', gender: 'female')
Actor.create!(name: 'Emma Roberts', bio: 'Emma Rose Roberts is an American actress and singer. ', gender: 'female')
Actor.create!(name: 'Shailene Woodley', bio: 'Shailene Diann Woodley is an American actress.', gender: 'female')
Actor.create!(name: 'Selena Gomez', bio: 'Selena Gomez is an American actress and singer.', gender: 'female')
Actor.create!(name: 'Owen Wilson', bio: 'Owen Cunningham Wilson is an American actor, comedian, writer, producer and screenwriter.', gender: 'male')
Actor.create!(name: 'Liam Neeson', bio: 'Liam John Neeson is an actor from Northern Ireland.[ ', gender: 'male')
Actor.create!(name: 'Daniel Radcliffe', bio: 'Daniel Jacob Radcliffe is an English actor who rose to prominence as the title character in the Harry Potter film series.', gender:'male')

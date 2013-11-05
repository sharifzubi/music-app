# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Track.delete_all


#Users
u1 = User.create!(name: "Sharif", role: "admin", email: "szubi@me.com", genre: "RocknRoll", about: "YEEEA", password: "1234")
u2 = User.create!(name: "Will Heard", role: "artist", email: "willheardmusic@gmail.com", genre: "R&B", about: "Londons Finest", password: "1234")
u3 = User.create!(name: "Scarlett", role: "listener", email: "scarlett@scarlett.com", genre: "None", about: "Just a listener", password: "1234")
u4 = User.create!(name: "Philippa", role: "listener", email: "philippa@philippa.com", genre: "None", about: "Just a listener", password: "1234")
u5 = User.create!(name: "Prince", role: "artist", email: "prince@prince.com", genre: "Funk", about: "Greatest musician on planet earth", password: "1234")
u6 = User.create!(name: "Ludovico Einaudi", role: "artist", email: "ludovico@ludovico.com", genre: "Classical", about: "One man & his piano", password: "1234")

#Tracks
t1 = Track.create!(title: "Sonnentanz", release_date: "August 2013")
t2 = Track.create!(title: "Seize the Day", release_date: "October 2011")
t3 = Track.create!(title: "Need Some Loving", release_date: "June 2012")
t4 = Track.create!(title: "I Wanna Be Your Lover", release_date: "July 1999")
t5 = Track.create!(title: "Una Mattina", release_date: "June 2010")

u2.tracks << t1
u2.tracks << t2
u2.tracks << t3
u5.tracks << t4
u6.tracks << t5

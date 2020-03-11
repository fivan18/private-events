# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.new 
a.username = "certilremy"
a.email = "certilremy@gmail.com"
a.password = "123456"
a.save

c = User.new 
c.username = "certilremy2"
c.email = "certilremy2@gmail.com"
c.password = "123456"
c.save

b = Event.new
b.title = "festival music"
b.location = "Haiti"
b.date = Date.new 
b.description = "blaaaa blaaaa"
b.creator_id = a.id
b.save
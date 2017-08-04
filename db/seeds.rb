# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Prompt.destroy_all
Post.destroy_all


peppers = Prompt.create(title: "Hot Sauce", prompt: "You're driving through rural Kansas and make a pitstop at a gas station. As you pay for your bag of chips, an attendant challenges you to eat one of his home-grown peppers. It looks nothing like any pepper you've ever seen.", img_url: "https://static.pexels.com/photos/173880/pexels-photo-173880.jpeg")
kayak = Prompt.create(title: "Kayak", prompt: "You wake up in your ocean-front villa to a loud bang. Evacuation sirens sound off. You and the other thousand residents of your building have five minutes to vacate the island. There are only five kayaks.", img_url: "https://static.pexels.com/photos/175837/pexels-photo-175837.jpeg")
snow = Prompt.create(title: "Snow", prompt: "Is it day or night? It's hard to know any longer. The snow hasn't let up for two weeks.", img_url: "https://static.pexels.com/photos/60561/winter-snow-nature-60561.jpeg")

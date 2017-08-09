# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Prompt.destroy_all
Post.destroy_all
Comment.destroy_all

joey = User.create(email: "joey@spicypeppers.com", password: "jalapeno")

peppers = Prompt.create(title: "Hot Sauce", prompt: "You're making a pitstop at a gas station, and just as you got to pay for your bag of chips, an attendant challenges you to eat one of his home-grown peppers.", img_url: "https://static.pexels.com/photos/173880/pexels-photo-173880.jpeg", user: joey)
siren = Prompt.create(title: "Siren", prompt: "You wake up in your ocean-front villa to a loud bang. Evacuation sirens sound off.", img_url: "https://static.pexels.com/photos/175837/pexels-photo-175837.jpeg", user: joey)
snow = Prompt.create(title: "Snow", prompt: "Is it day or night? It's hard to know any longer. The snow hasn't let up for two weeks.", img_url: "https://static.pexels.com/photos/60561/winter-snow-nature-60561.jpeg", user: joey)
breathless = Prompt.create(title: "Breathless", prompt: "Scampering through the woods, you think you've finally lost him. You take refuge in a battered shelter. Then you hear the door kicked in.", img_url: "https://static.pexels.com/photos/8578/pexels-photo.jpg", user: joey)
magic = Prompt.create(title: "Magic", prompt: "A street magician takes away your ability to speak. Then he disappears, too.", img_url: "https://static.pexels.com/photos/236243/pexels-photo-236243.jpeg", user: joey)
skyscraper = Prompt.create(title: "Skyscraper", prompt: "To make your wish come true, you must take a massive leap of faith.", img_url: "https://static.pexels.com/photos/380283/pexels-photo-380283.jpeg", user: joey)
underwater_surprise = Prompt.create(title: "Underwater Surprise", prompt: "As you surface from a scuba dive, you see a ticker attached to your boat with a minute left.", img_url: "https://static.pexels.com/photos/71276/diver-diving-swimming-sea-71276.jpeg", user: joey)

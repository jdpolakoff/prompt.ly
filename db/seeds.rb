# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Prompt.destroy_all
Post.destroy_all
Comment.destroy_all


peppers = Prompt.create(title: "Hot Sauce", prompt: "You're driving through rural Kansas and make a pitstop at a gas station. As you pay for your bag of chips, an attendant challenges you to eat one of his home-grown peppers. It looks nothing like any pepper you've ever seen.", img_url: "https://static.pexels.com/photos/173880/pexels-photo-173880.jpeg")
kayak = Prompt.create(title: "Kayak", prompt: "You wake up in your ocean-front villa to a loud bang. Evacuation sirens sound off. You and the other thousand residents of your building have five minutes to vacate the island. There are only five kayaks.", img_url: "https://static.pexels.com/photos/175837/pexels-photo-175837.jpeg")
snow = Prompt.create(title: "Snow", prompt: "Is it day or night? It's hard to know any longer. The snow hasn't let up for two weeks.", img_url: "https://static.pexels.com/photos/60561/winter-snow-nature-60561.jpeg")
breathless = Prompt.create(title: "Breathless", prompt: "Scampering through the woods, you think you've finally lost him. You take refuge in a battered shelter. Then you hear the door kicked in.", img_url: "https://static.pexels.com/photos/8578/pexels-photo.jpg")
magic = Prompt.create(title: "Magic", prompt: "A street magician makes your wife disappear. Then he disappears, too.", img_url: "https://static.pexels.com/photos/236243/pexels-photo-236243.jpeg")
skyscraper = Prompt.create(title: "Skyscraper", prompt: "You've been granted your one wish: you can fly. But to make it come true, the genies says your first flight has to be off the top of a skyscraper.", img_url: "https://static.pexels.com/photos/380283/pexels-photo-380283.jpeg")
underwater_surprise = Prompt.create(title: "Underwater Surprise", prompt: "You come up from your dive thinking about an afternoon beer. You turn your head and see a ticker attached to your boat with a minute left.", img_url: "https://static.pexels.com/photos/71276/diver-diving-swimming-sea-71276.jpeg")
dolphin = Prompt.create(title: "Dolphin", prompt: "You're going for a quick swim when you hear a distant call for help. It grows nearer. You look over to see a dolphin staring at you down its nose, asking you to take a fishing hook out of its dorsal fin.", img_url: "https://static.pexels.com/photos/403359/pexels-photo-403359.jpeg")

# db/seeds.rb

puts 'Cleaning database...'
User.destroy_all
Itinerary.destroy_all
City.destroy_all
ItineraryCity.destroy_all
Category.destroy_all
Spot.destroy_all
ItinerarySpot.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    email: "ferdinand@email.com",
    password: "123456",
    first_name: "ferdinand",
    following: 142,
    follower: 67,
    presentation: "Hi there ! My idea is that I can help anyone; from someone that has never traveled or done a backpacking trip before to someone that has already traveled a lot but still might find some good advice on this site that can help him or her on the next adventure. And as a philosopher once said: “I know that I know nothing.” Even after all that I have already traveled (but believe me, compared to some people that I’ve met, I’ve still only seen very little of the scope of the world), there are still a lot of things that I do not know as I am always learning and developing myself as a person.",
    rating: "3",
    country: "Poland, Chile, Mexico, New York",
    itineraryofuser: "Party in Peru",
    countryoforigin: "France"

  },
  {
    email: "pierre@email.com",
    password: "123456",
    first_name: "pierre",
    following: 121,
    follower: 76,
    presentation: "Hello, you! Anyone can backpack as there are trips to suit any size wallet. Nowadays, luxurious backpacking is becoming “fashionable” where the travelers use taxi as their principal mode of transportation and stay in hostels that are more expensive than 3-star hotels!! However, there are still other backpackers that travel the world hitchhiking and staying in the houses of strangers using couchsurfing and finish their entire trip with minimal cost. For others, like myself, there is a middle ground where I try to save on transportation and accommodation, but I don’t keep my wallet closed when it’s time to have fun and adventure. For me, as long as it takes you out of your comfort zone, it is worth trying.",
    rating: "3",
    country: "Belgium, Peru, Canada, New York",
    itineraryofuser: "Party in Peru",
    countryoforigin: "Chile"
  },
  {
    email: "sophie@email.com",
    password: "123456",
    first_name: "sophie",
    following: 32,
    follower: 16,
    presentation: "Welcome! Although I really like backpacking as it is the most economical way of seeing the world that I have found, this does not mean that I don’t like other forms of travel. For me, the important thing is to be in a new place with the opportunity to meet other people and to see cultures and customs different from those that I already know. Therefore, the type of the trip doesn’t matter to me whether it be a package to Disneyland, a luxurious beach resort with my family, a Caribbean cruise, or a ski trip with friends. I like to explore the world, however it may be.",
    rating: "3",
    country: "France, Peru, Canada, New York, Japan",
    itineraryofuser: "Urban in New York",
    countryoforigin: "France"
  },
  {
    email: "yannick@email.com",
    password: "123456",
    first_name: "yannick",
    following: 122,
    follower: 86,
    presentation: "Nice to meet you! Certainly, no matter what type of trip I am doing, I always do a Free Walking Tour if they are available in the city that I am visiting… if you have never heard of them, I will explain them more on my site as they are something not to be missed!  I will also keep a Blog with some advice about specific locations, general travel information, and some interesting stories that have happened during my wanderings. Well, that’s all for now folks. If you would like to know more about me and how I “left the system” to begin traveling around the world, continue reading below.",
    rating: "3",
    country: "Spain, Korea, Salvador, Peru, Canada, New York",
    itineraryofuser: "Culture in Korea",
    countryoforigin: "Belgium"
  },
]

User.create!(users_attributes)

puts 'Creating Itineraries...'
itineraries_attributes = [
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user: User.first
  },
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user: User.first
  },
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user: User.first
  },
  {
    country: "Peru",
    experience: "urban",
    budget: 1000,
    days: 15,
    user: User.first
  },
  {
    country: "Peru",
    experience: "culture",
    budget: 1000,
    days: 15,
    user: User.first
  },
  {
    country: "Peru",
    experience: "adventure",
    budget: 1000,
    days: 15,
    user: User.first
  },
]

Itinerary.create!(itineraries_attributes)

puts 'Creating cities...'
city_attributes = [
  { name: "Cuzco" },
  { name: "Lima" },
  { name: "Ica" },
  { name: "Arequipa" },
  { name: "Puno" },
  { name: "Nazca" },
  { name: "Puerto maldonado" },
  { name: "Huaraz" },
  { name: "Iuaraz" },
  { name: "Mancora" },
]

City.create!(city_attributes)

puts 'Creating itinerary_cities...'
city_1 = City.first
city_2 = City.second
city_3 = City.third
city_4 = City.fourth
city_5 = City.fifth
city_6 = City.first
city_7 = City.second
city_8 = City.third
city_9 = City.fourth
city_10 = City.fifth

itinerary_cities_attributes = [
  { itinerary: Itinerary.first, city: city_1 },
  { itinerary: Itinerary.first, city: city_2 },
  { itinerary: Itinerary.first, city: city_3 },
  { itinerary: Itinerary.first, city: city_4 },
  { itinerary: Itinerary.first, city: city_5 },
  { itinerary: Itinerary.second, city: city_6 },
  { itinerary: Itinerary.second, city: city_7 },
  { itinerary: Itinerary.second, city: city_8 },
  { itinerary: Itinerary.second, city: city_9 },
  { itinerary: Itinerary.second, city: city_10 },
  { itinerary: Itinerary.third, city: city_1 },
  { itinerary: Itinerary.third, city: city_3 },
  { itinerary: Itinerary.third, city: city_5 },
  { itinerary: Itinerary.third, city: city_7 },
  { itinerary: Itinerary.third, city: city_9 },
]

ItineraryCity.create!(itinerary_cities_attributes)

puts 'Creating categories...'
category_attributes = [
  {
    title: "restaurant"
  },
  {
    title: "hotel"
  },
  {
    title: "activity"
  },
]

Category.create!(category_attributes)

puts 'Creating spots...'
spots_attributes = [
  {
    title: "Hanz Craft Beer",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Indigo",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Republica Del Pisco",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Eco-View Bar",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Nuevo Mundo Bar",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Estadio Restaurante",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "La Basilica Restaurante",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Museo Del Pisco",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "restaurant"),
  },
   {
    title: "Alma Bar Restaurant",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Atumpa",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Chita Voladora",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Buena Picanteada",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "Tambo Tacama",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "La Olla de Juanita",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "restaurant El Pallar",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "restaurant"),
  },
  {
    title: "El Cordon y la Rosa",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "restaurant"),
  },
    {
    title: "Wild rover hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Milhouse",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Intro Hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Puriwasi",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Pool Paradize",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Loki Hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Puriwasi hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "The Prime Spots",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "MB Hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Rover Hostel Arequipa",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Arequipay - packers hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Dragonfly Hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Amaris Tour hostel",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Banana's adventure",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Wild Rovers ICA",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "The Upcycle",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "hotel"),
  },
  {
    title: "Pisco Cuzco Tour",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Salkenta Trail",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "1 day trip ATV",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Discovery of the inca Valley",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Bicycle tour - Miraflores",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Surf day trip",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Pub Crawl - Miraflores",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Peruvian Night out!",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Lima"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Two days trekking Colca",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Qochamama Party",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Peruvian Dance at Casona",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Pimen river attractions",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Arequipa"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Buggy Desert tour Huacachina",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Surf in the Dunes!",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Pub-crawl ICA",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "activity"),
  },
  {
    title: "Visit of Nazca line",
    address: "Something",
    zip_code: "Something",
    city: City.find_by(name: "Ica"),
    category: Category.find_by(title: "activity"),
  },
]

Spot.create!(spots_attributes)

puts 'Creating itinerary_spots...'
spot_1 = Spot.first

itinerary_spots_attributes = [
  {
    itinerary: Itinerary.first,
    spot: spot_1,
    days: 3
  },
]

ItinerarySpot.create!(itinerary_spots_attributes)

puts 'Finished!'

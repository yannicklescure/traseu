# db/seeds.rb

puts 'Cleaning database...'
User.destroy_all
Category.destroy_all
Spot.destroy_all
City.destroy_all



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
  }
]

Category.create!(category_attributes)

puts 'Creating users...'
users_attributes = [
  {
    email: "ferdinand@email.com",
    password: "123456",
    first_name: "ferdinand"
  },
  {
    email: "pierre@email.com",
    password: "123456",
    first_name: "pierre"
  },
  {
    email: "sophie@email.com",
    password: "123456",
    first_name: "sophie"
  },
  {
    email: "yannick@email.com",
    password: "123456",
    first_name: "yannick"
  },
]

User.create!(users_attributes)

cuzco = City.create({ name: "Cuzco" })
lima = City.create({ name: "Lima" })
ica = City.create({ name: "Ica" })
arequipa = City.create({ name: "Arequipa" })
puno = City.create({ name: "Puno" })
#nazca = City.create({ name: "Nazca" })
#puerto_maldonado = City.create({ name: "Puerto maldonado" })
#huaraz = City.create({ name: "Huaraz" })
#iquitos = City.create({ name: "Iuaraz" })
#mancora = City.create({ name: "Mancora" })


puts 'Creating spots...'
spots_attributes = [
  {
    city: cuzco,
    address: "cuzco peru"
  },
  {
    city: lima,
    address: "lima peru"
  },
  {
    city: ica,
    address: "ica peru"
  },
  {
    city: arequipa,
    address: "arequipa peru"
  },
  {
    city: puno,
    address: "puno peru"
  },
  # {
  #   city: huaraz,
  #   address: "huaraz peru"
  # },
  # {
  #   city: iquitos,
  #   address: "iquitos peru"
  # },
  # {
  #   city: mancora,
  #   address: "mancora peru"
  # },
  # {
  #   city: puerto_maldonado,
  #   address: "Puerto Maldonado peru"
  # },
]

Spot.create!(spots_attributes)

puts 'Finished!'

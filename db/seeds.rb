# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

<<<<<<< HEAD
20.times do |i|
  Customer.create!(
    email: "test#{i+1}@test",
    password: "password#{i+1}",
    postal_code: "0123456#{i+1}",
    address: "address#{i+1}",
    phone_number: "00000#{i+1}",
    surname: "testName#{i+1}",
    firstname: "testFirst#{i+1}",
    surname_kana: "testName_kana#{i+1}",
    firstname_kana: "testFirst_kana#{i+1}",
    is_active: true,
    )

  Item.create!(
    name: "name#{i+1}",
    specifcation: "setumei#{i+1}",
    price_without: "#{i+1}",
    genre_id: "#{i+1}",
    item_status: true,
  )

  Genre.create!(

  )
end
=======
Admin.create!(
  email: 'test@test',
  password: 'testtest',
)
>>>>>>> 787a080c85abb1ad7a37719f789ef93ef61abe76

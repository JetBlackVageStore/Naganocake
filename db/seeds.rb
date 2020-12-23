# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@test',
  password: 'testtest'
)
# Customer.create!(email: 'a@aa',
#                 password: 'ffffff',
#                 surname: 'test',
#                 firstname: 'testa',
#                 surname_kana: 'ア',
#                 firstname_kana: 'ア',
#                 postal_code: '1234567',
#                 address: 'aaaa',
#                 phone_number: '000000000')

# Order.create!(customer_id: '1',
#               charge: '800',
#               payment: 1,
#               addressee: 'sss',
#               address: 'a',
#               postal_code: '0000000',
#               order_status: 0,
#               payjp_id: 1,
#               created_at: '21 Dec 2020 20:00:00',
#               updated_at: '21 Dec 2020 20:00:01'
# )

# OrderItem.create!(item_id: '1',
#                     order_id: '1',
#                     quantity: '20',
#                     prod_status: 0,
#                     created_at: '21 Dec 2020 20:00:00',
#                     updated_at: '21 Dec 2020 20:00:01'
# )

# Genre.create!(genre_id: "1",
#               genre_name: 'ケーキ',
#               genre_status: true)

# Item.create!(   genre_id: '1',
#                 name: 'ケーキ',
#                 specifcation: '説明',
#                 price_without: '1200'
# )
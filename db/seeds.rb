# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do

Customer.create(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    phone: Faker::PhoneNumber.cell_phone_in_e164
)

end

10.times do

    Products.create(
        title: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        quantity: Faker::Number.within(range: 50..100), 
        customer_id: nil
    )
    
end
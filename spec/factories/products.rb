FactoryBot.define do
    factory :product do
      title { Faker::Commerce.product_name }
      price { Faker::Commerce.price }
      quantity { Faker::Number.within(range: 50..100) }
      customer_id { nil }
    end
  end
  
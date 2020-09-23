FactoryBot.define do
    factory :customer do
      name { Faker::Name.first_name }
      surname { Faker::Name.last_name }
      email { Faker::Internet.free_email }
      phone { Faker::PhoneNumber.cell_phone_in_e164 }
    end
  end
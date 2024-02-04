# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    jti { Faker::Name.unique.name }
    role { 'customer' }
  end
end

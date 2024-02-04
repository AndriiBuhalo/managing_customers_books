# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    to_create(&:save)

    name { Faker::Name.unique.name }
    title { Faker::Book.title }
    description { Faker::Name.unique.name }

    association :customer, factory: :customer
  end
end

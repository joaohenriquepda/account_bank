require 'faker'

FactoryGirl.define do
    factory :account do |f|
      f.name { Faker::Name.name }
      f.cpf { Faker::IDNumber.brazilian_id }
      f.email { Faker::Internet.email }
      f.password_digest = "password"
      f.account_balance = 0
    end
  end
require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'existinguser@existinguser.com'
    password 'password'
  end
end

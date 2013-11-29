require 'factory_girl'

FactoryGirl.define do
  factory :sale do
    address '123 Easy St'
    city 'Salem'
    state 'OR'
    zip '97304'
    sale_type 'garage'
    sale_date Date.tomorrow
    description 'Just one ballin sale'
  end
end

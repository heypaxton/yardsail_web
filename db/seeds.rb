# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times { Sale.create(sale_type: 'estate', sale_date: rand(10.months).from_now, description: 'One ballin sale after another. Get it while you can.', address: '123 Easy St', city: 'Salem', state: 'OR', zip: rand(10000...99999) )} 

25.times { Sale.create(sale_type: 'garage', sale_date: rand(10.months).from_now, description: 'One ballin sale after another. Get it while you can.', address: '321 ABC Ln', city: 'Salem', state: 'OR', zip: rand(10000...99999) )} 

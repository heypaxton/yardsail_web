class Sale < ActiveRecord::Base
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :sale_type, presence: true
  validates :description, presence: true, :length => { minimum: 15}
end

class Product < ActiveRecord::Base
	has_many :invoices

	validates :name, presence: true
	validates :price, presence: true

	scope :cheapest_first, lambda { order("products.price ASC") }
end

class Invoice < ActiveRecord::Base
	belongs_to :product

	scope :by_product_id, lambda { order("product_id ASC")}
end

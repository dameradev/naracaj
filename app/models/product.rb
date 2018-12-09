class Product < ApplicationRecord

  has_many :product_categories
  has_many :firms, through: :product_categories
  has_many :variants, class_name: 'ProductVariant'
  belongs_to :category
end

class Product < ApplicationRecord

  belongs_to :firm

  has_many :variants, class_name: 'ProductVariant'
  belongs_to :category
end

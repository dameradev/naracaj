class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :firm
  accepts_nested_attributes_for :product
end

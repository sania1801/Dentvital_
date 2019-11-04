class Material < ApplicationRecord

  # validates :value, numericality: { greater_than_or_equal_to: 0 }
  has_many :service_material

end
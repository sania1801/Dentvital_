class ServiceOrder < ApplicationRecord
  has_one :order
  belongs_to :service
end

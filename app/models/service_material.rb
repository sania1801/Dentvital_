class ServiceMaterial < ApplicationRecord
belongs_to :material
belongs_to :service

# accepts_nested_attributes_for :services, allow_destroy: true
end

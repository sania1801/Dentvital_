class Order < ApplicationRecord

  belongs_to :patient

  has_many :service_orders, dependent: :destroy

  accepts_nested_attributes_for :service_orders ,allow_destroy: true,
   reject_if: lambda {|attributes| attributes['value'].blank?}


 def math_data(order)
    patient = order.patient
    order.date_order = DateTime.now
    order.age = math_age(patient.dob)
    order.service_orders.each do |t|
      order.total += (t.service.cost.to_f * t.value)
  end

  end

  def writing_off(sign,order)
      order.service_orders.each do |service_order|
      service_id = service_order.service.id
      service_material = ServiceMaterial.where(["service_id = ?",service_id]).first
      unless service_material.nil?
        material = Material.where({service_material: service_material.id}).first
        material.value += sign * service_material.value_m * service_order.value
        material.save 
      end
    end
  end

private

  def math_age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end


end

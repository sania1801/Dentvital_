class Order < ApplicationRecord



  belongs_to :patient

  has_many :service_orders, dependent: :destroy

  accepts_nested_attributes_for :service_orders ,allow_destroy: true,
                                reject_if: lambda {|attributes| attributes['value'].blank?}

   # before_create do                        
   def write_off(order,sign)
     write_off_all(order,sign)
   end
 # end

  def write_off_all(order,sign)
    order.service_orders.each do |so|
      write_off_masks(sign,so)
      write_off_indicators(sign,so)
      write_off_ejectors(sign,so)
      write_off_gloves(sign,so)
      write_off_serviettes(sign,so)
      write_off_injectors(sign,so)
      write_off_needles(sign,so)
      write_off_ubestisine(sign,so)
      write_off_brushes(sign,so)
      write_off_polishing_paste(sign,so)
      write_off_borons(sign,so)
      write_off_matrix_metal(sign,so)
      write_off_matrix_lavsan(sign,so)
      write_off_matrix_lavsan_kontur(sign,so)
      write_off_applicators(sign,so)
      write_off_etching_gel(sign,so)
      write_off_adgesive(sign,so)
      write_off_calcium(sign,so)
      write_off_flow(sign,so)
      write_off_compomer(sign,so)
      write_off_ketak_molar(sign,so)
      write_off_ketak_univers(sign,so)
      write_off_estelit_asteria(sign,so)
      write_off_estelit_posterior(sign,so)
      write_off_composit(sign,so)
      write_off_vetrimer(sign,so)
      write_off_disks(sign,so)
      write_off_strips(sign,so)
      write_off_depulpine(sign,so)
      write_off_dentin(sign,so)
      write_off_pulpoeckstraktors(sign,so)
      write_off_files(sign,so)
      write_off_canal_fillers(sign,so)
      write_off_spreders(sign,so)
      write_off_endometosone(sign,so)
      write_off_viedent(sign,so)
      write_off_metrosol(sign, so)
      write_off_apexdent(sign,so)
      write_off_resodent(sign,so)
      write_off_shtifts_glass(sign,so)
      write_off_shtift_gutaperch(sign,so)
      write_off_shtift_papers(sign, so)
      write_off_shifts_parapulp(sign,so)
      write_off_clin_pro_silan(sign,so)
    end
  end

  def find_material(id_material)
    Material.find(id_material)
  end

  def write_off_masks(sign,so)
    #   @service_material = ServiceMaterial.where(service.id: so.service.id).first
    #   if @service_material != nil
    #   material = @service.material
    #   material.value += sign * so.value * ServiceMaterial.value_m
    #   material.save
    # end
  end

  def write_off_indicators(sign,so)
    if so.service.id == 5
      material = find_material( 2)
      material.value += sign * so.value * 6
      material.save
    end
  end

  def write_off_ejectors(sign,so)
    if so.service.id == 7
      material = find_material( 3)
      material.value += sign * so.value
      material.save
    end
  end

  def write_off_gloves(sign,so)
    material = find_material( 4)

    if so.service.id == 8
      material.value += sign * so.value * 2
    end

    material.save
  end

  def write_off_serviettes(sign,so)
    material = find_material( 5)
    if so.service.id == 6
      material.value += sign * so.value
    end
    material.save
  end

  def write_off_injectors(sign,so)
    material = find_material( 6)

    if so.service.id == 13
      material.value += sign * so.value
    end

    if so.service.id == 127
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_needles(sign,so)
    material = find_material( 7)
    if so.service.id == 14
      material.value += sign * so.value
    end
    material.save
  end

  def write_off_ubestisine(sign,so)
    material = find_material( 8)

    if so.service.id == 15
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_brushes(sign,so)
    material = find_material( 9)

    if so.service.id == 12
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 23
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 112
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 25
      material.value += sign * so.value * 0.05
    end

    if so.service.id == 26
      material.value += sign * so.value * 0.05
    end

    material.save
  end

  def write_off_polishing_paste(sign,so)

    material = find_material( 10)

    if so.service.id == 12
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 23
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 25
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 26
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 112
      material.value += sign * so.value * 0.2
    end

    material.save
  end

  def write_off_borons(sign,so)
    material = find_material( 11)

    if so.service.id == 26
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 29
      material.value += sign * so.value * 0.2
    end

    if so.service.id == 28
      material.value += sign * so.value * 0.25
    end

    if so.service.id == 30
      material.value += sign * so.value * 0.25
    end

    if so.service.id == 120
      material.value += sign * so.value * 0.25
    end

    if so.service.id == 27
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 143
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 145
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 146
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 31
      material.value += sign * so.value * 0.33
    end

    if so.service.id == 32
      material.value += sign * so.value * 0.5
    end

    if so.service.id == 121
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_matrix_metal(sign, so)
    material = find_material(12)

    if so.service.id == 45
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_matrix_lavsan(sign, so)
    material = find_material(13)

    if so.service.id == 44
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_matrix_lavsan_kontur(sign,so)
    material = find_material(14)

    if so.service.id == 43
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_applicators(sign,so)
    material = find_material(15)

    if so.service.id == 38
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_etching_gel(sign,so)
    material = find_material(16)

    if so.service.id == 41
      material.value += sign * so.value * 0.1
    end

    material.save
  end

  def write_off_adgesive(sign,so)
    material = find_material(17)

    if so.service.id == 39
      material.value += sign * so.value * 0.1
    end

    material.save
  end

  def write_off_calcium(sign,so)
    material = find_material(18)

    if so.service.id == 33
      material.value += sign * so.value * 0.1
    end

    material.save
  end

  def write_off_flow(sign,so)
    material = find_material(19)

    if so.service.id == 37
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 53
      material.value += sign * so.value * 0.2
    end

    material.save
  end

  def write_off_compomer(sign,so)
    material = find_material(20)

    if so.service.id == 107
      material.value += sign * so.value * 0.2
    end

    if so.service.id == 108
      material.value += sign * so.value * 0.3
    end

    material.save
  end

  def write_off_ketak_molar(sign,so)
    material = find_material(21)

    if so.service.id == 35
      material.value += sign * so.value * 0.3
    end

    material.save
  end

  def write_off_ketak_univers(sign,so)
    material = find_material(22)

    if so.service.id == 47
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 48
      material.value += sign * so.value * 0.4
    end

    if so.service.id == 49
      material.value += sign * so.value * 0.5
    end

    if so.service.id == 50
      material.value += sign * so.value * 0.6
    end

    material.save
  end

  def write_off_estelit_asteria(sign,so)
    material = find_material(23)

    if so.service.id == 51
      material.value += sign * so.value * 0.2
    end

    if so.service.id == 55
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 101
      material.value += sign * so.value * 0.4
    end

    if so.service.id == 104
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_estelit_posterior(sign,so)
    material = find_material(24)

    if so.service.id == 52
      material.value += sign * so.value * 0.2
    end

    if so.service.id == 56
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 102
      material.value += sign * so.value * 0.4
    end

    if so.service.id == 105
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_composit(sign,so)
    material = find_material(25)

    if so.service.id == 109
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 110
      material.value += sign * so.value * 0.4
    end

    if so.service.id == 111
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_vetrimer(sign,so)
    material = find_material(26)

    if so.service.id == 54
      material.value += sign * so.value * 0.2
    end

    if so.service.id == 36
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 57
      material.value += sign * so.value * 0.3
    end

    if so.service.id == 103
      material.value += sign * so.value * 0.4
    end

    if so.service.id == 106
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_disks(sign,so)
    material = find_material(27)

    if so.service.id == 115
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_strips(sign,so)
    material = find_material(28)

    if so.service.id == 116
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_depulpine(sign,so)
    material = find_material(29)

    if so.service.id == 117
      material.value += sign * so.value * 0.1
    end

    material.save
  end

  def write_off_dentin(sign,so)
    material = find_material(30)

    if so.service.id == 118
      material.value += sign * so.value * 0.5
    end

    material.save
  end

  def write_off_pulpoeckstraktors(sign,so)
    material = find_material(31)

    if so.service.id == 124
      material.value += sign * so.value * 2
    end

    material.save
  end

  def write_off_files(sign,so)
    material = find_material(32)

    if so.service.id == 125
      material.value += sign * so.value * 1.2
    end

    if so.service.id == 126
      material.value += sign * so.value * 1.6
    end

    if so.service.id == 137
      material.value += sign * so.value * 2
    end

    if so.service.id == 136
      material.value += sign * so.value * 1.5
    end

    material.save
  end

  def write_off_canal_fillers(sign,so)
    material = find_material(33)

    if so.service.id == 131
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 132
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 140
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 141
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 142
      material.value += sign * so.value * 0.1
    end

    if so.service.id == 144
      material.value += sign * so.value * 0.1
    end

    material.save
  end

  def write_off_spreders(sign,so)
    material = find_material(34)

    if so.service.id == 133
      material.value += sign * so.value * 0.16
    end

    if so.service.id == 134
      material.value += sign * so.value * 0.16
    end

    material.save
  end

  def write_off_endometosone(sign,so)
    material = find_material(35)

    if so.service.id == 133
      material.value += sign * so.value * 0.15
    end

    material.save
  end

  def write_off_viedent(sign,so)
    material = find_material(36)

    if so.service.id == 134
      material.value += sign * so.value * 0.15
    end

    material.save
  end

  def write_off_shtift_gutaperch(sign,so)
    material = find_material(37)

    if so.service.id == 135
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_shtift_papers(sign,so)
    material = find_material(38)

    if so.service.id == 129
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_metrosol(sign,so)
    material = find_material(39)

    if so.service.id == 144
      material.value += sign * so.value * 0.3
    end

    material.save
  end

  def write_off_apexdent(sign,so)
    material = find_material(40)

    if so.service.id == 131
      material.value += sign * so.value * 0.3
    end

    material.save
  end

  def write_off_resodent(sign,so)
    material = find_material(41)

    if so.service.id == 123
      material.value += sign * so.value * 0.1
    end

    material.save
  end


  def write_off_shtifts_glass(sign,so)
    material = find_material(42)

    if so.service.id == 141
      material.value += sign * so.value
    end

    material.save
  end


  def write_off_shifts_parapulp(sign,so)
    material = find_material(43)

    if so.service.id == 142
      material.value += sign * so.value
    end

    material.save
  end

  def write_off_clin_pro_silan(sign,so)
    material = find_material(44)

    if so.service.id == 25
      material.value += sign * so.value * 0.1
    end

    material.save
  end


end

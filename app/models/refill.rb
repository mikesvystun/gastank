class Refill < ApplicationRecord
belongs_to :car

validates :liters, presence: true, numericality: true, length: {maximum: 12}
validates :vartist, presence: true, numericality: true, length: {maximum: 12}
validates :probig, presence: true, numericality: true, length: {maximum: 12}


  def avg_uah_l
    avg_uah_l = vartist / liters
    avg_uah_l.round(2)
  end 



  def probig_since_last_full
    return '-' unless full
    previous_full_refill = self.car.refills.where('id < ? AND full = ?', self.id, true).order(id: :asc).last
    if previous_full_refill.present?
      self.probig - previous_full_refill.probig   
    else
      return 0
    end
  end

  
  def avg_rozhid
    return '-' unless full 
    previous_full_refill = self.car.refills.where('id < ? AND full = ?', self.id, true).order(id: :asc).last
    
    @refills = car.refills
    if previous_full_refill.present?
    full_rozhid = self.liters
      @refills.each do |refill|
        if refill.id < self.id && refill.id > previous_full_refill.id
          full_rozhid += refill.liters 
        end
      end
    return full_rozhid
    else
      return car.refills.first.liters 
    end
  end

end

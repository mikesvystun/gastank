class Refill < ApplicationRecord
belongs_to :car

validates :liters, presence: true, numericality: true, length: {maximum: 12}
validates :vartist, presence: true, numericality: true, length: {maximum: 12}
validates :probig, presence: true, numericality: true, length: {maximum: 12}



  def probig_since_last_full
    return '-' unless full 
    last_full
    return "start" unless @previous_full_refill.present?
    
    self.probig - @previous_full_refill.probig   
    
  end
  
  def avg_rozhid
    return '-' unless full 
    last_full
    return "start" unless @previous_full_refill.present?

    (since_last_full(liters) / probig_since_last_full * 100).round(2)
  end

  def km_na_l
    return '-' unless full
    last_full
    return "start" unless @previous_full_refill.present?

    (probig_since_last_full / since_last_full(liters)).round(2)


  end

  def ml_na_ga
    return '-' unless full
    last_full
    return "start" unless @previous_full_refill.present?
    
    ((probig_since_last_full * 0.621371192) / (since_last_full(liters) * 0.264172052)).round(2)
  end

  def avg_uah_km
    return '-' unless full
    last_full
    return "start" unless @previous_full_refill.present?
    
   (since_last_full(vartist) / probig_since_last_full).round(2)
  end

  def avg_uah_l
    return '-' unless full
    last_full
    return "start" unless @previous_full_refill.present?
    
    (since_last_full(vartist) / since_last_full(liters)).round(2)
  end 


private

def last_full
    @previous_full_refill = self.car.refills.where('id < ? AND full = ?', self.id, true).order(id: :asc).last
end

def since_last_full(n)
self.car.refills.where('id <= ? AND id > ?', self.id, @previous_full_refill.id).sum(n) 
end


end

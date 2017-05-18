class Refill < ApplicationRecord
belongs_to :car
belongs_to :gasstation
belongs_to :gasmark
belongs_to :stan

attr_accessor :overliters

validates :liters, presence: true, numericality: true, length: {maximum: 12}
validates :vartist, presence: true, numericality: true, length: {maximum: 12}
validates :probig, presence: true, numericality: {greater_than_or_equal_to: :last_known_probig }, length: {maximum: 12}, if: :full?
validates :full, inclusion: { in: [true], message: "Перша заправка мусить бути до повного" }, if: :first_refill?

  def first_refill?
    !self.car.refills.any?
  end

  def full?
    full
  end
 
  def last_known_probig
    self.car.refills.where('refills.probig IS NOT NULL').order(probig: :asc).last.try(:probig) || 0
  end

  def probig_since_last_full
    return '-' unless full 
    return "start" if view_first_refill?
    last_full
    self.probig - last_full.probig
  end
  
  def avg_rozhid
    return '-' unless full 
    return "start"  if view_first_refill?
    (since_last_full(:liters) / probig_since_last_full * 100).round(2)
  end


  def avg_uah_km
    return '-' unless full
    return "start"  if view_first_refill?
    (since_last_full(:vartist) / probig_since_last_full).round(2)
  end



  def overliters_vartist
    if !self.overliters.nil?
      self.overliters / self.liters * self.vartist
    end
  end


private

  def last_full
    self.car.refills.where('id < ? AND refills.full IS TRUE', self.id).order(id: :asc).last ||= self
  end

  def since_last_full(n)
    self.car.refills.where('id <= ? AND id > ?', self.id, last_full.id).sum(n)
  end

  def view_first_refill?
    self.car.refills.where('id < ? AND refills.full IS TRUE', self.id).empty?
  end

end



#  def km_na_l
#    return '-' unless full
#    last_full
#    return "start" unless last_full.present?
#
#    (probig_since_last_full / since_last_full(:liters)).round(2)
#  end

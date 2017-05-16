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
    if self.car.refills.where('refills.probig IS NOT NULL').order(probig: :asc).empty?
      return 0
    else
      self.car.refills.where('refills.probig IS NOT NULL').order(probig: :asc).last.probig
    end
  end

  def probig_since_last_full
    return '-' unless full 
    return "start" if view_first_refill?
    last_full
    self.probig - @previous_full_refill.probig
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


private

  def last_full
    @previous_full_refill = self.car.refills.where('id < ? AND refills.full IS TRUE', self.id).order(id: :asc).last
    if self.car.refills.where('id < ? AND refills.full IS TRUE', self.id).empty?
      @previous_full_refill = self
    end
  end

  def since_last_full(n)
    self.car.refills.where('id <= ? AND id > ?', self.id, @previous_full_refill.id).sum(n)
  end

  def view_first_refill?
    self.car.refills.where('id < ? AND refills.full IS TRUE', self.id).empty?
  end

end



#  def km_na_l
#    return '-' unless full
#    last_full
#    return "start" unless @previous_full_refill.present?
#
#    (probig_since_last_full / since_last_full(:liters)).round(2)
#  end

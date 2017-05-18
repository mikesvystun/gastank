module RefillsHelper
def refill_row_class(refill)
  refill.full ? "full-row" : "" 
end


def refill_edit_class(refill)
  refill.id != @car.refills.last.id ? "hidden" : "" 
end

end

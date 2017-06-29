module RefillsHelper
def refill_row_class(refill)
  refill.full ? "success" : "" 
end


def refill_edit_class(refill)
  refill.id != @car.refills.last.id ? "hidden" : "clear-b" 
end

end

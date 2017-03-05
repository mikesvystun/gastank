module RefillsHelper

def refill_row_class(refill)
  refill.full ? "full-row" : "" 
end

end

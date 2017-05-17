module RefillsHelper
def refill_row_class(refill)
  refill.full ? "full-row" : "" 
end


def refill_edit_class(refill)
  refill.id != @car.refills.last.id ? "hidden" : "" 
end

end

def overfill_edit_form_label(refill, attribute, text)

  refill.id.nil? ? (label_tag attribute, text) : (hidden_field_tag attribute)
end


def overfill_edit_form(refill, attribute)

  refill.id.nil? ? (text_field_tag attribute) : (hidden_field_tag attribute)

end



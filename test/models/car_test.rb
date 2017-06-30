require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


test "should not save car without title" do
  car = Car.new
  assert_not car.save,  "Saved the car without a title"
end


end

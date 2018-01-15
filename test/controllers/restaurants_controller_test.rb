require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Should have a title called Add your Restaurant" do
    get restaurants_new_url
    assert_select '#title', 'Add your Restaurant'
  end

  test "Should render with form when adding a new restaurant" do
    get restaurants_new_url
    assert_select '#add_restaurant_form'
  end

end

require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Should have a title called Restaurants" do
    get restaurants_new_url
    assert_select '#title', 'Add your Restaurant'
  end

end

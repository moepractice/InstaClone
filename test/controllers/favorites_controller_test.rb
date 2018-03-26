require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:integer" do
    get favorites_user_id:integer_url
    assert_response :success
  end

  test "should get insta_id:integer" do
    get favorites_insta_id:integer_url
    assert_response :success
  end

end

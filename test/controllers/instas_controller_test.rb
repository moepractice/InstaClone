require 'test_helper'

class instasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instas_index_url
    assert_response :success
  end

end

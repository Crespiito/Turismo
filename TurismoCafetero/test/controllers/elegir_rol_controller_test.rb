require 'test_helper'

class ElegirRolControllerTest < ActionDispatch::IntegrationTest
  test "should get elegir" do
    get elegir_rol_elegir_url
    assert_response :success
  end

end

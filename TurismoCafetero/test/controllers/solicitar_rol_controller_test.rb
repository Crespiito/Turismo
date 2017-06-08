require 'test_helper'

class SolicitarRolControllerTest < ActionDispatch::IntegrationTest
  test "should get solicitud" do
    get solicitar_rol_solicitud_url
    assert_response :success
  end

end

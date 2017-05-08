require 'test_helper'

class RegistroUsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get registro" do
    get registro_usuarios_registro_url
    assert_response :success
  end

end

require 'test_helper'

class CambiarPassControllerTest < ActionDispatch::IntegrationTest
  test "should get cambio" do
    get cambiar_pass_cambio_url
    assert_response :success
  end

end

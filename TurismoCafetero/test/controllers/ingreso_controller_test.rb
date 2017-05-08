require 'test_helper'

class IngresoControllerTest < ActionDispatch::IntegrationTest
  test "should get session" do
    get ingreso_session_url
    assert_response :success
  end

end

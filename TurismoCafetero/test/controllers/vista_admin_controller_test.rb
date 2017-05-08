require 'test_helper'

class VistaAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get vista_admin_admin_url
    assert_response :success
  end

end

require 'test_helper'

class VistaRootControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get vista_root_root_url
    assert_response :success
  end

end

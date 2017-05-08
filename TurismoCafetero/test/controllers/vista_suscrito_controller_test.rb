require 'test_helper'

class VistaSuscritoControllerTest < ActionDispatch::IntegrationTest
  test "should get suscrito" do
    get vista_suscrito_suscrito_url
    assert_response :success
  end

end

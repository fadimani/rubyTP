require "test_helper"

class UtilisateursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get utilisateurs_new_url
    assert_response :success
  end
end

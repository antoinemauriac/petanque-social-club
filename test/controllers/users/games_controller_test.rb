require "test_helper"

class Users::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_games_index_url
    assert_response :success
  end
end

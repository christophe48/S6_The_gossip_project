require 'test_helper'

class TeamPageControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get team_page_team_url
    assert_response :success
  end

end

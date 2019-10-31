require 'test_helper'

class ContactPageControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_page_contact_url
    assert_response :success
  end

end

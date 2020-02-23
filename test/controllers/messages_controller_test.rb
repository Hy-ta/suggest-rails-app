require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get messages_resources_url
    assert_response :success
  end

end

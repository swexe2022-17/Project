require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get top_user_url
    assert_response :success
  end

  test "should get company" do
    get top_company_url
    assert_response :success
  end

  test "should get work" do
    get top_work_url
    assert_response :success
  end

end

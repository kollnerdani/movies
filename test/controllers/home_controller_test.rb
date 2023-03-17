require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get home_search_url(query: "something", page: 1)
    assert_response :success
    puts "Controller Test"
    puts "Passed"
  end
end

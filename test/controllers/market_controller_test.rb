require 'test_helper'

class MaketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maket_index_url
    assert_response :success
  end

end

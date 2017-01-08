require 'test_helper'

class ClosedTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get send_report" do
    get closed_tickets_send_report_url
    assert_response :success
  end

end

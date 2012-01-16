require 'test_helper'

class ReservasControllerTest < ActionController::TestCase

  def test_export_to_CSV
    get :index, :format => "csv"

    assert_response :success
    assert_match /csv/, response.content_type, "respond with csv"
  end
end


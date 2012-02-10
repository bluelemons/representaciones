require 'test_helper'

class ReservasControllerTest < ActionController::TestCase

  def test_export_to_CSV
    get :index, :format => "csv"

    assert_response :success
    assert_match /csv/, response.content_type, "respond with csv"
    headers, *data = CSV.parse(response.body, col_sep: ";" )
    # Hash[[header, data].transpose]
    required_headers = %w[ id agencia operadora salida referencia
                           bruto seguro iva neto moneda ]
    required_headers.each do |header|
      assert_includes headers, header
    end

    required_data = %W[ 21,5 ]
    required_data.each do |value|
      assert_includes data.flatten, value
    end
  end
end


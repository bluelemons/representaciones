require 'test_helper'

class DateHelperTest < ActionView::TestCase
  def test_beauty_date
    [reservas(:costa_magica).salida, reservas(:costa_magica).created_at].each do |value|
      string = beauty_date(value)
      assert_match /^<time.*>.*<\/time>$/, string, "is not a time element"
      assert_match /class="[\w\s]*appendTimeago[\w\s]*"/, string, "hasn't the class appendTimeago"
      assert beauty_date(value).html_safe?, "the html is not marked as safe"
    end
  end
end


require 'test_helper'

class DateHelperTest < ActionView::TestCase
  def test_beauty_date
    value = reservas(:costa_magica).salida # 2012-03-19
    assert_equal "<time date='utcdate' >19 de Marzo de 2012</time>", beauty_date(value)

    value = reservas(:costa_magica).created_at  # 2011-05-27 21:04:01.000000000Z
    assert_equal "<time datetime='utcdatetime' >27 de Mayo de 2011</time>", beauty_date(value)

    assert beauty_date(value).html_safe?, "the html is not marked as safe"
  end
end


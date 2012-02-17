require 'test_helper'

class DateHelperTest < ActionView::TestCase
  def test_beauty_date
    [reservas(:costa_magica).salida, reservas(:costa_magica).created_at].each do |value|
      string = beauty_date(value)
      assert_match /^<time.*>.*<\/time>$/, string, "is not a time element"
      assert_match /class="[\w\s]*appendTimeago[\w\s]*"/, string, "hasn't the class appendTimeago"

      /datetime="(?<datetime>.*)".*>(?<contents>.*)<\/time>/ =~ string
      assert_nothing_raised do
        DateTime.iso8601(datetime)
      end

      assert_match /\w{3} \d{2}\/\w{3}\/\d{4}/, contents, "la fecha esta mal escrita"
      assert_match /\d{2}:\d{2}/, contents, "la hora no esta escrita" if value.acts_like?(:time)
      assert beauty_date(value).html_safe?, "the html is not marked as safe"
    end
  end
end


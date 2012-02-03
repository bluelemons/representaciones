module DateHelper
  def beauty_date(value)
    string = value.to_date.today? ? I18n.localize(value.to_time) : I18n.localize(value.to_date, :format => :long)
    hace_o_en = value.past? ? "hace" : "en"
    distance = distance_of_time_in_words_to_now value
    string << " (#{hace_o_en} #{distance})"
    string
  end
end


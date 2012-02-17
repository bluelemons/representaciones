module DateHelper
  def beauty_date(value)
    format = value.acts_like?(:time) ? "%a %d/%b/%Y, %H:%M" : "%a %d/%b/%Y"
    contents = I18n.localize(value, :format => format)
    content_tag(:time, contents, :datetime => value.to_time.getutc.iso8601, :class => 'appendTimeago')
  end
end


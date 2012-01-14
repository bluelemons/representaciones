#config/initializers/numeric_localize.rb
class Numeric
  def localize(options = {})
    value = self
    options.symbolize_keys!

    defaults = I18n.translate(:'number.format', :locale => options[:locale], :default => {})
    options = options.reverse_merge(defaults)

    parts = value.to_s.split('.')
    parts.join(options[:decimal_mark])
  end
end


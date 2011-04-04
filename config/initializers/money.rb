# Initialize money gem
Money::Currency::TABLE[:usd].update(
  { :priority    => 2,
    :subunit     => "Centavo",
    :symbol      => "u$s",
    :html_entity => "u$s"
  })
Money::Currency::TABLE[:ars].update(
  { :priority    => 1,
    :name        => "Peso Argentino",
    :html_entity => "&#36;"
  })
Money::Currency::TABLE[:eur][:priority] = 3
Money::Currency::TABLE[:gbp][:priority] = 4

Money.default_currency = Money::Currency.new(:ars)

class Money
  def self.monedas
    [:ars, :usd, :eur].map do |m|
      Money::Currency.new(m)
    end
  end
end

Money.default_currency = Money::Currency.new(:ars)

class ActiveRecord::Base
  def self.monetize(atrb)
    composed_of atrb.to_sym, :class_name => "Money",
      :mapping => [%W(#{atrb.to_s}_cents cents), %W(#{atrb.to_s}_currency currency_as_string)],
      :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
      :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  end

  def self.find_values opts
    sql = self.send(:construct_finder_sql, opts)
    self.connection.select_values(sql)
  end
end


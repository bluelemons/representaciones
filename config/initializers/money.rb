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
Money.default_bank     = Money::Bank::VariableExchange.new do |float|
  float.to_d.round(0,7).to_i
end

class ActiveRecord::Base
  def self.monetize(atrb)
    composed_of atrb.to_sym, :class_name => "Money",
      :mapping => [%W(#{atrb.to_s}_cents cents), %W(#{atrb.to_s}_currency currency_as_string)],
      :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
      :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.inspect} of class #{value.class} to Money") }
    self.class_eval <<-fin, "method #{atrb.to_sym} in: " + __FILE__, __LINE__ + 1
      def #{atrb.to_s}_fields=(fields)
        self.#{atrb.to_s} = fields[:#{atrb.to_s}].to_money(fields[:#{atrb.to_s}_currency])
      end
    fin
  end
end


require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  test "user with table can manage entidads" do
    user = users(:tester)
    ability = Ability.new(user)
    assert ability.can?(:new, Agency), "No puede crear agencias"
    assert ability.can?(:edit, Entidad), "No puede editar entidades"
    assert ability.can?(:destroy, Operadora), "No puede borrar operadoras"
  end
end


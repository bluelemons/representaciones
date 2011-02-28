require 'spec_helper'

describe <%= class_name %> do
  #asociaciones
  <% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  it { shuld belong_to :<%= attribute.name %> }
  <% end -%>
  pending "add some more examples to (or delete) #{__FILE__}"
end


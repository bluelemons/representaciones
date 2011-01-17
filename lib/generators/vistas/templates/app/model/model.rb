class <%= file_name_c %> < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  <% for attribute in @model_attributes %>
    <% if attribute.name[-3..-1]=="_id" %>
  belongs_to :<%= attribute.name[0..-4] %><% end %><% end %>  
  #validaciones
  <% for attribute in @model_attributes %>
  #validates :<%= attribute.name %>, :presence => true<% end %>
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end

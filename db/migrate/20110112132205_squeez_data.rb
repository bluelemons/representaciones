class SqueezData < ActiveRecord::Migration
  def self.up
    Role.create :name=>'Admin',:desc=>'Es el Rol de administrador'
    User.create :username=>'olvap',:email=>'youre-mail@mail.com',:password_confirmation=>'admin6',:password=>'admin6', :role_ids=>[1]
    User.create :username=>'eloy',:email=>'eloy-mail@mail.com',:password_confirmation=>'admin8',:password=>'admin8', :role_ids=>[1]
    Site.create :name =>'Squeezer',:slogan=>'Porque a nadie le gusta exprimir pero a todos les gusta la limonada',:style=>'squeezer'    
  end
end

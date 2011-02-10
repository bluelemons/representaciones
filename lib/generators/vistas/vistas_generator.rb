require 'rails/generators/migration'
require 'rails/generators/generated_attribute'

class VistasGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => "application"
  argument :attributes, :type => :array, :default => [], :banner => 'array con los atributos'

  class_option :migration, :default => true, :desc => 'Don\'t generate migrations files.', :type => :boolean
  class_option :controller, :default => true, :desc => 'Don\'t generate a controller file.', :type => :boolean
  class_option :model, :default => true, :desc => 'Don\'t generate a model file.', :type => :boolean
  class_option :views, :default => true, :desc => 'Don\'t generate a views file.', :type => :boolean
  class_option :pdf, :default => true, :desc => 'Don\'t generate a pdfs file.', :type => :boolean
  class_option :route, :default => true, :desc => 'Don\'t generate routes.', :type => :boolean
  class_option :javascript, :default => true, :desc => 'Don\'t generate application.js', :type => :boolean

  def generate_layout
     @model_attributes = []

    attributes.each do |arg|
      if arg.include?(':')
        @model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
      end
    end

    #controlador
    if !options.controller?
      template "app/controller/controller.rb", "app/controllers/#{plural_name}_controller.rb"
    end

    #modelo
    if !options.model?
      template "app/model/model.rb", "app/models/#{file_name}.rb"
    end

    #vistas
    if !options.views?
      #index
      template "app/views/index.haml", "app/views/#{plural_name}/index.haml"
      template "app/views/index.js.erb", "app/views/#{plural_name}/index.js.erb"
      template "app/views/_search.haml", "app/views/#{plural_name}/_search.haml"
      template "app/views/lista.haml", "app/views/#{plural_name}/_#{plural_name}.haml"
      #show
      template "app/views/single.haml", "app/views/#{plural_name}/_#{file_name}.haml"
      #template "app/views/_version.haml", "app/views/#{plural_name}/_version.haml"
      #saque el version y lo puse en el layout
      template "app/views/_version.haml", "app/views/layouts/_version.haml"
      #form
      template "app/views/_form.haml", "app/views/#{plural_name}/_form.haml"
      #new
      template "app/views/new.haml", "app/views/#{plural_name}/new.haml"
      template "app/views/_new.haml", "app/views/#{plural_name}/_new.haml"
      template "app/views/new.js.erb", "app/views/#{plural_name}/new.js.erb"
      #edit
      template "app/views/edit.haml", "app/views/#{plural_name}/edit.haml"
      template "app/views/_edit.haml", "app/views/#{plural_name}/_edit.haml"
      template "app/views/edit.js.erb", "app/views/#{plural_name}/edit.js.erb"

      #show
      template "app/views/show.haml", "app/views/#{plural_name}/show.haml"
      template "app/views/show.js.erb", "app/views/#{plural_name}/show.js.erb"
    end
    #pdf
    if !options.pdf?
      template "app/reports/index_report.erb", "app/reports/#{file_name}_report.rb"
    end

    #migration
    if !options.migration?
      migration_template 'db/migration_create.rb', "db/migrate/create_#{plural_name}.rb"
      sleep 1
      migration_template 'db/migration_globales.rb', "db/migrate/add_globals_#{plural_name}.rb"
      sleep 1
      migration_template 'db/migration_versionate.rb', "db/migrate/add_versionate_#{plural_name}.rb"
    end

    #javascript
    if !options.javascript?
      template "public/applications.js", "public/javascripts/application.js"
    end
    #routes
    if !options.route?
      route "resources :#{plural_name}"
    end

  end

  private
  def file_name
    layout_name.underscore
  end

  def plural_name
    "#{file_name}s"
  end

  def file_name_c
    file_name.capitalize
  end

  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

end


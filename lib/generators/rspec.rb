require 'rails/generators/named_base'

module Rspec
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_rspec_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'rspec', generator_name, 'templates'))
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute #:nodoc:
      def input_type
        @input_type ||= case type
          when :text then "textarea"
          when :integer then if @name =~ /.+_id$/ then
              "select"
            else
              "input"
            end
          else "input"
        end
      end
    end
  end
end


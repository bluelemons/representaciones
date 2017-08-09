# MonkeyPatch https://github.com/rails/rails/issues/11026
# should be removed when rails is updated
if Rails::VERSION::MAJOR == 3 && Rails::VERSION::MINOR == 0
  module ActiveRecord
    module Associations
      class AssociationProxy
        def send(method, *args)
          if proxy_respond_to?(method, true)
            super
          else
            load_target
            @target.send(method, *args)
          end
        end
      end
    end
  end
else
  raise "Please remove monkey patch in #{ __FILE__ }"
end

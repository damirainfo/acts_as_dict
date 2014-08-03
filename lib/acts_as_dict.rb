require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require 'acts_as_dict/engine'

module ActsAsDict
  extend ActiveSupport::Autoload

  autoload :Static
  autoload :StaticType
  autoload :StaticValue
end

ActiveSupport.on_load(:active_record) do
  extend ActsAsDict::Static
end

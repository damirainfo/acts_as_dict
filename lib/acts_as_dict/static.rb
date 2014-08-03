module ActsAsDict
  module Static
    def dict_attr(attr)
      attr.each {|k, v|
        class_eval %{
          def #{k}_human
            Dict::StaticValue.where(static_type_code: "#{v}", code: #{k}).first.name
          end
        }
      }
      attr.each {|k, v|
        instance_eval %{
          def #{k.to_s.pluralize}
            Dict::StaticValue.#{v}
          end
        }
      }
    end
  end
end
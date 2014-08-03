module ActsAsDict
  module Static
    def acts_as_dict_attr(attr)
      attr.each {|k, v|
        class_eval %{
          def #{k}_human
            ActsAsDict::StaticValue.where(static_type_code: "#{v}", code: #{k}).first.name
          end
        }
      }
      attr.each {|k, v|
        instance_eval %{
          def #{k.to_s.pluralize}
            ActsAsDict::StaticValue.#{v}
          end
        }
      }
    end
  end
end
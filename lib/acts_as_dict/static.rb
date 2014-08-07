module ActsAsDict
  module Static
    def acts_as_dict(*args)
      options = args.extract_options!.dup

      args.map(&:to_sym).uniq.each { |k|
        class_eval %{
          def #{k}_human
            ActsAsDict::StaticValue.where(static_type_code: "#{k}", code: #{k}).first.name
          end
        }
      }

      args.map(&:to_sym).uniq.each {|k|
        instance_eval %{
          def #{k.to_s.pluralize}
            ActsAsDict::StaticValue.#{k}
          end
        }
      }

      options.each {|k, v|
        class_eval %{
          def #{k}_human
            ActsAsDict::StaticValue.where(static_type_code: "#{v}", code: #{k}).first.name
          end
        }
      }
      options.each {|k, v|
        instance_eval %{
          def #{k.to_s.pluralize}
            ActsAsDict::StaticValue.#{v}
          end
        }
      }
    end
  end
end
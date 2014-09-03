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
          
          def #{k.to_s}_human(code)
            send(#{k.to_s}.to_sym, code).try(:name)
          end

          def #{k.to_s}(code)
            ActsAsDict::StaticValue.where(static_type_code: "#{v}", code: code).first
          end
        }
      }
    end
  end
end

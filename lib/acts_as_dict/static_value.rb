module ActsAsDict
  class StaticValue < ::ActiveRecord::Base
    self.table_name = :dict_static_values

    belongs_to :static_type, class_name: 'ActsAsDict::StaticType', foreign_key: :static_type_code

    enum status: [:active, :blocked]

    scope :static_type_code_eq, lambda { |name| where("static_type_code" => name) }

    class << self
      def method_missing(name)
        unless ActsAsDict::StaticType.all_types.include? name
          ActsAsDict::StaticType.create(code: name.to_s)
        end
        method_name=name.to_s.downcase
        listed_attr = static_type_code_eq(method_name).to_a
        listed_attr
      end
    end
  end
end
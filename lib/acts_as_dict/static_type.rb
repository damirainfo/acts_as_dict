module ActsAsDict
  class StaticType < ::ActiveRecord::Base
    self.table_name = :static_types

    self.primary_key = :code

    belongs_to :parent, class_name: 'ActsAsDict::StaticType'
    has_many :static_values, class_name: 'ActsAsDict::StaticValue', forgein_key: :static_type_code

    enum status: [:active, :blocked]

    before_save :strip_and_downcase_code
    validates_uniqueness_of :code

    class << self
      def all_types
        all.map(&:code).map(&:to_sym)
      end
    end

    def revert(arg)
      if arg.is_a?(String)
        ActsAsDict::StaticType.where(code: arg).first.try(:id)
      elsif arg.is_a?(Fixnum)
        ActsAsDict::StaticType.where(id: arg).first.try(:code )
      end
    end

    private

    def strip_and_downcase_code
      if code.present?
        code.gsub!(/\s+/, '')
        code.downcase!
      end
    end
  end
end
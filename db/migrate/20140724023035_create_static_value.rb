class CreateStaticValue < ActiveRecord::Migration
  def change
    create_table :static_values do |t|
      t.string     :static_type_code, null: false
      t.string     :code,             null: false
      t.string     :name,             null: false
      t.integer    :sort
      t.integer    :status,           null: false, default: 0
    end

    add_index :static_values, [ :static_type_code, :code]
  end
end

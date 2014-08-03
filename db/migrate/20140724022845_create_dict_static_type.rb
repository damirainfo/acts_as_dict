class CreateDictStaticType < ActiveRecord::Migration
  def change
    create_table :dict_static_types, id: false, primary_key: 'code' do |t|
      t.string     :code,       null: false
      t.string     :name
      t.belongs_to :parent
      t.integer    :status,     null: false, default: 0
    end

    add_index :dict_static_types, :code
  end
end

class CreateStaticType < ActiveRecord::Migration
  def change
    create_table :static_types, id: false, primary_key: 'code' do |t|
      t.string     :code,       null: false
      t.string     :name
      t.belongs_to :parent
      t.integer    :status,     null: false, default: 0
    end

    add_index :static_types, :code
  end
end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string             :name, null: false
      t.text               :detail, null:false
      t.integer            :price, null: false
      t.references         :user, null: false, foreign_key: true
      t.integer            :category_id, null: false
      t.integer            :quality_id, null: false
      t.integer            :delivery_cost_id, null: false
      t.integer            :prefecture_id, null: false
      t.integer            :delivery_time_id, null: false

      t.timestamps
    end
  end
end

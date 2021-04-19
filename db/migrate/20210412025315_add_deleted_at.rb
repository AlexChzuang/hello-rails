class AddDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :deleted_at, :datetime
    add_index :restaurants, :deleted_at    # 查詢速度會變快
    # 二元樹 db index
  end
end

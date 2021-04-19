class AddUserToRestaurant < ActiveRecord::Migration[6.1]
  def change
    # add_column :restaurants, :user_id, :integer
    # add_index :reestaurants, :user_id

    add_reference(:restaurants, :user)  # 取代上面兩行
  end
end

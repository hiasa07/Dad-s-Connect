class AddUserIdToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :user_id, :integer, null: true # 一時的に null を許可
    add_index :rooms, :user_id
  end
end

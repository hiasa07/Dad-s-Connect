class ChangeUserIdNotNullInRooms < ActiveRecord::Migration[7.1]
  def change
    change_column_null :rooms, :user_id, false
  end
end

class ChangeUserIdNotNullInRooms < ActiveRecord::Migration[7.1]
  def up
    # NULL のレコードを削除または更新
    Room.where(user_id: nil).update_all(user_id: 1) # または delete_all

    # NOT NULL 制約の追加
    change_column_null :rooms, :user_id, false
  end

  def down
    change_column_null :rooms, :user_id, true
  end
end

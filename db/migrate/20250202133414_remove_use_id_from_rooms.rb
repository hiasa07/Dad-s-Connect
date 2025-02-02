class RemoveUseIdFromRooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :rooms, :User_id, :string
  end
end

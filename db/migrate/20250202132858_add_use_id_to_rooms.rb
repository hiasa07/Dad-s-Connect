class AddUseIdToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :User_id, :string
  end
end

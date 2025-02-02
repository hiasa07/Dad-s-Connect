class RoomsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @room = Room.create!
      @entry1 = Entry.create!(room_id: @room.id, user_id: current_user.id)
      @entry2 = Entry.create!(room_id: @room.id, user_id: params.dig(:room, :entry, :user_id)) # 修正
    
      redirect_to user_room_path(current_user, @room)
    end    
  
    def show
      @room = Room.find(params[:id])
      if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
      #Roomで相手の名前表示するために記述
        @myUserId = current_user.id
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end  
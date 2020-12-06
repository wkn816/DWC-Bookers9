class RoomsController < ApplicationController
  def create
    #  byebug
    @user = User.find(params[:user_id])
    @user.rooms.each do |user_room|
      current_user.rooms.each do |current_user_room|
        if current_user_room.id == user_room.id
         return redirect_to room_path(user_room.id)
        end
      end
    end
      room = Room.create
      UserRoom.create(user_id: current_user.id, room_id: room.id)
      UserRoom.create(user_id: params[:user_id], room_id: room.id)
      redirect_to room_path(room.id)
    
  end

  def show 
    @user
    @chat = Chat.new
    @room = Room.find(params[:id])
    @chats = Chat.where(room_id: @room.id)
    @room.users.each do |user|
      unless user == current_user 
        @user = user
      end
    end
    
  end

end

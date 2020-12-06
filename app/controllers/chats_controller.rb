class ChatsController < ApplicationController
  def show
    user_room = UserRoom.find(params[:id])
    @user = user_room.user
    @room = user_room.room
    @chats = Chat.where(user_id: current_user.id, room_id: @room.id)
    @recieved = Chat.where(user_id: @user.id, room_id: @room.id)
  end

  def create
    
    @chat = Chat.new(chat_params)
    @chat.room_id = params[:room_id]
    @chat.user_id = current_user.id
    # byebug
    @chat.save
    # @chats = Chat.where(user_id: current_user.id, room_id: params[:room_id])
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :message)
  end

end

class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @events = current_user.participated_events
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:id)
  end
end

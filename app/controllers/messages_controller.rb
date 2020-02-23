class MessagesController < ApplicationController
  
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      flash[:notice] = "message was successfully sent !"
    else
      redirect_to rooms_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:sender_id, :user_id, :room_id, :content)
  end
  
end

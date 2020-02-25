class MessagesController < ApplicationController
  
  def index
    @messages = Message.order(created_at: :asc)
    @users = User.all
  end

  def show
    @messages = Message.all
    @user = User.find(params[:id])
  end

  def create
    message = Message.new(message_params)
    message.user = current_user
    # if message.save
    #   ActionCable.server.broadcast 'messages',
    #     message: message.content,
    #     user: message.user.username
    #     flash[:notice] = "Your message was successfully sent !"
    #   head :ok 
    # end
  end

  private
  def message_params
    params.require(:message).permit(:sender_id, :user_id, :room_id, :content)
  end
  
end

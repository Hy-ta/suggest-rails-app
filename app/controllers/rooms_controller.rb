class RoomsController < ApplicationController

    def new
      @room = Room.new
    end

    def show
      @room = Room.find(params[:id])
      @user = User.find(params[:id])
      @messages = Message.all
    end


    private

    def room_params
        params.require(:room).permit(:user1, :user2, :user_id, :content)
    end
      
end

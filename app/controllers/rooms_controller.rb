class RoomsController < ApplicationController

    def index
      @rooms = Room.all
    end

    def new
      @room = Room.new
    end

    def show
      @room = Room.find(params[:id])
      @user = User.find(params[:id])
      @messages = @room.messages.recent.limit(5).reverse
    end

    def create
      @room = Room.new(room_params)
      @user = current_user.id
      if @room.save
        flasf[:notice] = "New room was created !"
        current_user.user_rooms.create(room_id: @room.id)
        redirect_to rooms_path
      end
    end

    def top
      if user_signed_in? 
        @room = Room.new
        @rooms = current_user.rooms
        @rooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
      end
    end


    private

    def room_params
        params.require(:room).permit(:name, :user_id)
    end
      
end

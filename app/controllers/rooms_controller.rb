class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def search
    @key = params[:address]
    @keys = Room.where('address LIKE ?', "%#{@key}%" )
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: @room.user_id)
    @reservation = Reservation.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
      flash[:notice] = "ルームを登録しました"
    else
      flash.now[:alert] = "ルームを登録できませんでした"
      render "rooms/new"
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path, notice: "予約を削除しました。"
  end

  private 

  def room_params
    params.require(:room).permit(:room_img, :roomname, :introduction, :price, :created_at, :address, :user_id)
  end
end

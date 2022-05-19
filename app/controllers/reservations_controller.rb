class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms= Room.all
  end

  def show
    @user = current_user.id
    @reservation = Reservation.find(params[:id])
     @room = Room.find_by(params[@reservation.room_id])
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[@reservation.room_id])
    @days = (@reservation.end_day - @reservation.start_day).to_i
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation)
    else
      @user = User.find_by(id: current_user.id)
      flash.now[:alert] = "予約できませんでした"
      render "rooms/new"
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to reservations_path, notice: "予約を削除しました。"
  end
  
  private 

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :total_price, :start_day, :end_day, :number_people)
  end
end

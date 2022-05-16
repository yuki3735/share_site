class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @room = Room.find_by(id: @reservation.room_id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
    else
      @user = User.find_by(id: current_user.id)
      flash.now[:alert] = "予約できませんでした"
      render "rooms/show"
    end
  end

  private 
  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :total_price, :start_day, :end_day, :number_people)
  end
end

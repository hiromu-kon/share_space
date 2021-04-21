class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to user_reservations_path
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to user_reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to user_reservations_path
      else
      render :show
    end
  end

  def index
    @reservations = Reservation.all
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time).merge(user_id: current_user.id)
  end
end

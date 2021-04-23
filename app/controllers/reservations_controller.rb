class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を作成しました"
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
    if @reservation.update(update_reservation_params)
      redirect_to user_reservations_path
    else
      redirect_to root_path
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
    @reservation_user = User.find(params[:user_id])
    @reservations_user = Reservation.where(user_id: @reservation_user.id)
    @reserved = Reservation.where(reservation_user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def mylist
    @reserved_list = Reservation.where(reservation_user_id: current_user.id).or(Reservation.where(user_id: current_user.id).where.not(reservation_user_id: nil)).order(start_time: :asc)
  end

  private

  def reservation_params
    params.permit(:start_time, :end_time).merge(user_id: current_user.id)
  end

  def update_reservation_params
    params.permit(:reservation_user_id).merge(reservation_user_id: current_user.id)
  end
end

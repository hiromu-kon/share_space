class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.includes(:visitor, :visited, :comment, :message)
    .page(params[:page]).per(10).where.not(visitor_id: current_user.id)
    @notifications.update(checked: true)
  end

  def destroy_all
    current_user.passive_notifications.destroy_all
    flash[:notice] = '通知を全て削除しました！'
    redirect_to notifications_path
  end
end

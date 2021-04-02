class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.includes(:visitor, :visited, :comment, :message)
    .page(params[:page]).per(10).where.not(visitor_id: current_user.id)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    current_user.passive_notifications.destroy_all
    flash[:success] = '通知を全て削除しました！'
    redirect_to notifications_path
  end
end

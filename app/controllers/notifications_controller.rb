class NotificationsController < ApplicationController
  def index
   @notifications = PublicActivity::Activity.where(recipient_id: current_user.id)
    .order(created_at: :desc)
  end

  def read_all
    PublicActivity::Activity.where(recipient_id: current_user.id).update_all({readed: true})

    render json: {status: 'done'}, status: :ok
  end
end

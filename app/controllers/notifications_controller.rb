class NotificationsController < ApplicationController
  def send_notification
    @notification = Notification.new(notification_params)
    
    if @notification.save
      # Here you would integrate with your SMS sending service

      render json: { message: "Notification SMS sent successfully" }, status: :ok
    else
      render json: { errors: @notification.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def notification_params
    params.require(:notification).permit(:phone_number, :title, :content)
  end

end
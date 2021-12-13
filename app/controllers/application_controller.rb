class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sign_in_point
  
  def sign_in_point
    if user_signed_in? && Point.find_by(user_id: current_user.id, action: 0, created_at: Time.now.all_day).nil?
      point = Point.new
      point.user_id = current_user.id
      point.action = 0
      point.save
    end
  end
    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :image_id])
  end
end

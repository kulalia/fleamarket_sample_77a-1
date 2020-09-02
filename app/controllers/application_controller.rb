class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, user_profile_attributes: [:first_name, :first_name_kana, :family_name, :family_name_kana, :birthday], delivery_addresses_attributes: [:first_name, :first_name_kana, :family_name, :family_name_kana, :postal_code, :prefecture_id, :city, :address, :building, :phone_number]] )
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
  def production?
    Rails.env.production?
  end
end

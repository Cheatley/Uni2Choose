class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_account_update_params, only: [:update]

  def configure_account_update_params
    registration_params = [:name, :gender, :dob, :postcode, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    end
  end
end

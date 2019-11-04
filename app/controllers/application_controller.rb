class ApplicationController < ActionController::Base
  include Jumpstart::Controller
  include Teams::SubscriptionStatus
  include Users::TimeZone
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  def current_team
    @current_team ||= current_user.teams.find(session[:team_id])
  rescue ActiveRecord::RecordNotFound
    @current_team ||= current_user.teams.first
    @current_team ||= current_user.create_personal_team
  end
  helper_method :current_team

  protected

    # To add extra fields to Devise registration, add the attribute names to `extra_keys`
    def configure_permitted_parameters
      extra_keys  = [:avatar, :name, :time_zone]
      signup_keys = extra_keys + [:terms_of_service]
      devise_parameter_sanitizer.permit(:sign_up,           keys: signup_keys)
      devise_parameter_sanitizer.permit(:account_update,    keys: extra_keys)
      devise_parameter_sanitizer.permit(:accept_invitation, keys: extra_keys)
    end
end

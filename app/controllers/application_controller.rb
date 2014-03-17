class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :make_action_mailer_user_request_host_and_protocol

  def is_authenticated?
    redirect_to login_url if current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    @current_user = user
  end

  private
    def make_action_mailer_user_request_host_and_protocol
      ActionMailer::Base.default_url_options[:protocol] = request.protocol
      ActionMailer::Base.default_url_options[:host] = request.host_with_port
    end
end

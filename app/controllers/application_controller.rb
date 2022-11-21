class ApplicationController < ActionController::Base

  before_action :basic_auth
  

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SYUKKA'] && password == ENV['BASIC_AUTH_PASSWORD_SYUKKA']
    end
  end

  # after_action :set_csrf_token_header, if: :to_stocks_controller?

  # def set_csrf_token_header
  #   response.set_header('X-CSRF-Token', form_authenticity_token)
  # end
  
end

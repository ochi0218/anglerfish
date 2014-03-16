class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveResource::ConnectionError, ActiveResource::ServerError, with: :render_rest_api_connection_error

  #
  # REST-APIの通信エラーを表示する。
  #
  def render_rest_api_connection_error
      flash[:error_message] = I18n.t('errors.application_error.messages.rest_api_connection')
      render template: '/errors/application_error', layout: 'application_error', status: 500
  end
end

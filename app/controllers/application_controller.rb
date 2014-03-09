class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveResource::ConnectionError, ActiveResource::ServerError, with: :render_rest_api_connection_error

  #
  # 404エラーを表示する。
  #
  def render_404
      render file: "#{Rails.root}/public/404.html", layout: 'not_found', status: 404
  end

  #
  # REST-APIの通信エラーを表示する。
  #
  def render_rest_api_connection_error
      flash[:error_message] = I18n.t('errors.application_error.messages.rest_api_connection')
      render template: '/errors/application_error', layout: 'application_error', status: 500
  end
end

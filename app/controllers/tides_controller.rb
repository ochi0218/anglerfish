#
# 潮汐ページコントローラ
#
class TidesController < ApplicationController
  #
  # 初期ページ
  #
  def index
    @date = params[:date]
    @port_name = params[:port_name] || cookies[:last_search_port_name]
    cookies.permanent[:last_search_port_name] = @port_name if @port_name.presence

    begin
      @tide = Tide.get @date, @port_name
      @weather = Weather.get @port_name
    rescue ActiveResource::ConnectionError, ActiveResource::ServerError
      flash.now[:alert] = I18n.t('errors.application_error.messages.rest_api_connection')
    end
  end
end

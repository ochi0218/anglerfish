class TidesController < ApplicationController
  def index
    @date = params[:date]
    @port_name = params[:port_name] || cookies[:last_search_port_name] || Port.first.name
    cookies.permanent[:last_search_port_name] = @port_name if @port_name.presence

    begin
      @tide = Tide.get(@date, @port_name)
      @weather = Weather.get(@port_name)
    rescue ActiveResource::ConnectionError, ActiveResource::ServerError
      # 接続先でエラーが発生しても無視する。
    end
  end
end

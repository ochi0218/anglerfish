#
# 潮汐ページコントローラ
#
class TidesController < ApplicationController
  #
  # 初期ページ
  #
  def index
    date = params[:date]
    port_name = params[:port_name] || cookies[:last_search_port_name]
    cookies.permanent[:last_search_port_name] = port_name if port_name.presence

    @tide = Tide.get date, port_name
  end
end

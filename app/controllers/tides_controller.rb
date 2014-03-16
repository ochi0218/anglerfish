#
# 潮汐ページコントローラ
#
class TidesController < ApplicationController
  #
  # 初期ページ
  #
  def index
    cookies.permanent[:last_search_port_name] = port_name if params[:port_name].presence

    @tide = Tide.get date, port_name
  end
end

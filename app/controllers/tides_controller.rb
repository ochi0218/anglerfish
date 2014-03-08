#
# 潮汐ページコントローラ
#
class TidesController < ApplicationController
  #
  # 初期ページ
  #
  def index
    date = date_param.presence || Date.today
    port_name = port_name_param.presence || first_port_name

    cookies.permanent[:last_search_port_name] = port_name if port_name.presence

    @tide = Tide.get date, port_name
  end

  private

  #
  # 初回表示する港名を取得する。
  #
  def first_port_name
      cookies[:last_search_port_name].presence || Port.first.name
  end

  #
  # 表示日付のパラメータを取得する。
  # パラメータが存在し、日付として解析できるもののみパラメータとして認める。
  #
  def date_param
      return nil unless params[:date].present?

      begin
          Date.parse(params[:date])
      rescue
          # 解析に失敗したら無視
      end
  end

  #
  # 港名のパラメータを取得する。
  # パラメータ名が港データに存在する場合のみパラメータとして認める。
  #
  def port_name_param
    return nil unless params[:port_name].present?

    port = Port.find_by_name(params[:port_name])
    port.name unless port.nil?
  end
end

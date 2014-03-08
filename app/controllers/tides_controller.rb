class TidesController < ApplicationController
  def index
    date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    port_name = params[:port_name].presence || first_port_name

    cookies[:last_search_port_name] = port_name

    @tide = Tide.get date, port_name
  end

  private

  def first_port_name
      cookies[:last_search_port_name].presence || Port.first.name
  end
end

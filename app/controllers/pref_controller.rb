class PrefController < ApplicationController
  def index
    @region = Region.find(params[:region_id].to_i)
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end

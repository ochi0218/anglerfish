class PortController < ApplicationController
  def index
    @pref = Pref.find(params[:pref_id].to_i)
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end

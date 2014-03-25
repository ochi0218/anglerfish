#
# 地域ページコントローラ。
#
class RegionController < ApplicationController
  def index
    @regions = Region.all
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end

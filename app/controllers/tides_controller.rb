class TidesController < ApplicationController
  def index
    @tide = Tide.today '松山'
  end
end

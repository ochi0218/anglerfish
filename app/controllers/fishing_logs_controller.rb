class FishingLogsController < ApplicationController
  before_action :set_fishing_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @search = current_user.fishing_logs.search(params[:q])
    @search.sorts = ['fishing_date desc'] if @search.sorts.empty?
    @fishing_logs = @search.result.page(params[:page])
  end

  def show
  end

  def new
    if params[:fishing_log]
      @fishing_log = FishingLog.new(fishing_log_params)
    else
      @fishing_log = FishingLog.new
    end
  end

  def edit
  end

  def create
    @fishing_log = current_user.fishing_logs.build(fishing_log_params)

    respond_to do |format|
      if @fishing_log.save
        format.html { redirect_to @fishing_log, notice: I18n.t('fishing_logs.create.notice') }
        format.json { render action: 'show', status: :created, location: @fishing_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @fishing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @fishing_log.user = current_user

      if @fishing_log.update(fishing_log_params)
        format.html { redirect_to @fishing_log, notice: I18n.t('fishing_logs.update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fishing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fishing_log.destroy
    respond_to do |format|
      format.html { redirect_to fishing_logs_url, notice: I18n.t('fishing_logs.destroy.notice') }
      format.json { head :no_content }
    end
  end

private
  def set_fishing_log
    @fishing_log = current_user.fishing_logs.find(params[:id])
  end

  def fishing_log_params
    params.require(:fishing_log).permit(:fish_name, :fish_length, :fish_weight, :fishing_point_name, :fishing_method, :fishing_date, :fishing_time, :bait, :fish_image, :comment)
  end
end

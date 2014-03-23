#
# 釣果ページコントローラ。
#
class FishingLogsController < ApplicationController
  before_action :set_fishing_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /fishing_logs
  # GET /fishing_logs.json
  def index
    @fishing_logs = FishingLog.search(params[:search], params[:page])
  end

  # GET /fishing_logs/1
  # GET /fishing_logs/1.json
  def show
  end

  # GET /fishing_logs/new
  def new
    if params[:fishing_log]
      @fishing_log = FishingLog.new(fishing_log_params)
    else
      @fishing_log = FishingLog.new
    end
  end

  # GET /fishing_logs/1/edit
  def edit
  end

  # POST /fishing_logs
  # POST /fishing_logs.json
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

  # PATCH/PUT /fishing_logs/1
  # PATCH/PUT /fishing_logs/1.json
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

  # DELETE /fishing_logs/1
  # DELETE /fishing_logs/1.json
  def destroy
    @fishing_log.destroy
    respond_to do |format|
      format.html { redirect_to fishing_logs_url, notice: I18n.t('fishing_logs.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
  
    #
    # 釣果モデルを設定する。
    #
    def set_fishing_log
      @fishing_log = FishingLog.where(user_id: current_user.id).find(params[:id])
    end

    #
    # 釣果登録のパラメータ
    #
    def fishing_log_params
      params.require(:fishing_log).permit(:fish_name, :fish_length, :fish_weight, :fishing_point_name, :fishing_method, :fishing_date, :fishing_time, :bait, :fish_image, :comment)
    end
end

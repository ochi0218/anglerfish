class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_current_user

  private

  #
  # 現在ユーザを設定する。
  #
  def set_current_user
    User.current = current_user
  end
end

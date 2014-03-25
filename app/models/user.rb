#
# ユーザ
#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :fishing_logs

  #
  # 現在ユーザを設定する
  #
  def self.current=(user)
    Thread.current[:current_user] = user
  end

  #
  # 現在ユーザを取得する
  #
  def self.current
    Thread.current[:current_user]
  end
end

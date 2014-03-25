#
# 釣果オブジェクト
#
class FishingLog < ActiveRecord::Base
  belongs_to :user

  mount_uploader :fish_image, FishImageUploader

  validates :fish_name, :fishing_date, :fishing_time, presence: true
  validates :fish_image, file_size: { maximum: 0.5.megabytes.to_i }
  validates_numericality_of :fish_length, :fish_weight, greater_than: 0

  scope :by_newest, order('fishing_date DESC, fishing_time DESC')
  default_scope by_newest
  

  #
  # 検索オブジェクトから検索する。
  #
  def self.search(search, page)
    return page(page) if search.nil?

    FishingLog.where(fish_name_contains(search[:fish_name])).where(fishing_point_name_contains(search[:fishing_point_name])).page(page)
  end

  private

  def self.fish_name_contains(value)
    return squeel{} unless value.present?
    squeel{ fish_name.matches("%#{value}%") }
  end

  def self.fishing_point_name_contains(value)
    return squeel{} unless value.present?
    squeel{ fishing_point_name.matches("%#{value}%") }
  end
end

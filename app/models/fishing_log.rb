class FishingLog < ActiveRecord::Base
  belongs_to :user

  mount_uploader :fish_image, FishImageUploader

  validates :fish_name, :fishing_date, :fishing_time, presence: true
  validates :fish_image, file_size: { maximum: 0.5.megabytes.to_i }
  validates_numericality_of :fish_length, :fish_weight, greater_than: 0
end

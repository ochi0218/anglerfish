class FishingLog < ActiveRecord::Base
    belongs_to :user
    validates :fish_name, :fishing_date, :fishing_time, presence: true
    validates_numericality_of :fish_length, :fish_weight, greater_than: 0

    scope :by_newest, order('fishing_date DESC, fishing_time DESC')

    default_scope by_newest
end

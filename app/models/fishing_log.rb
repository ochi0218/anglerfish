class FishingLog < ActiveRecord::Base
    validates :fish_name, :fishing_date, :fishing_time, presence: true
    validates_numericality_of :fish_length, :fish_weight, greater_than: 0
end

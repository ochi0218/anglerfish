class CreateFishingLogs < ActiveRecord::Migration
  def change
    create_table :fishing_logs do |t|
      t.string :fish_name
      t.float :fish_length
      t.float :fish_weight
      t.string :fishing_point_name
      t.string :fishing_method
      t.date :fishing_date
      t.time :fishing_time
      t.string :bait
      t.string :comment

      t.timestamps
    end
  end
end

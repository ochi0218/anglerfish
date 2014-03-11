class AddFishImageToFishingLogs < ActiveRecord::Migration
  def change
    add_column :fishing_logs, :fish_image, :string
  end
end

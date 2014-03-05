class AddUserIdToFishingLogs < ActiveRecord::Migration
  def change
    add_column :fishing_logs, :user_id, :integer
  end
end

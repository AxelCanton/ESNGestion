class RenameMission < ActiveRecord::Migration[6.0]
  def change
    rename_column :participe2s, :missions_id, :mission_id
  end
end

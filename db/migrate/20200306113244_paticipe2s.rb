class Paticipe2s < ActiveRecord::Migration[6.0]
  def change
    rename_table :participes, :participe2s
  end
end

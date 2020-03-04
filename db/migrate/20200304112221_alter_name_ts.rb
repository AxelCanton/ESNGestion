class AlterNameTs < ActiveRecord::Migration[6.0]
  def change
    rename_table :travaillerSurs, :travailler_surs
  end
end

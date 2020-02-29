class AlterName < ActiveRecord::Migration[6.0]
  def change
    rename_table :equipes_employes, :employes_equipes
  end
end

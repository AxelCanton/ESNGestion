class EquipeEmploye < ActiveRecord::Migration[6.0]
  def change
    drop_table :employes_equipes
    change_table :employes do |t|
      t.belongs_to :equipe
    end
  end
end

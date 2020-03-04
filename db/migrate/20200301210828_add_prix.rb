class AddPrix < ActiveRecord::Migration[6.0]
  def change
    add_column :contrat_clients, :prixContrat, :numeric
  end
end

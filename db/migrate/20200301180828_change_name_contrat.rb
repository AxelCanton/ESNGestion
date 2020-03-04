class ChangeNameContrat < ActiveRecord::Migration[6.0]
  def change
    rename_table :contratClients, :contrat_clients
  end
end

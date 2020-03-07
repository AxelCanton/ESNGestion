class ContratTerminee < ActiveRecord::Migration[6.0]
  def change
    add_column :contrat_clients, :termine, :boolean
  end
end

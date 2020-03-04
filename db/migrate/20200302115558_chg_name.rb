class ChgName < ActiveRecord::Migration[6.0]
  def change
    rename_column :contrat_clients_type_services, :contratClient_id, :contrat_client_id
    rename_column :travaillerSurs, :contratClient_id, :contrat_client_id
    rename_column :participes, :contratClient_id, :contrat_client_id
  end
end

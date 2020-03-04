class RenameColTs < ActiveRecord::Migration[6.0]
  def change
    rename_column :contrat_clients, :type_services_id,:type_service_id
  end
end

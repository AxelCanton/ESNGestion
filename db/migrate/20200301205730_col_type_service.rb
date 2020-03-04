class ColTypeService < ActiveRecord::Migration[6.0]
  def change
    rename_column :contrat_clients_type_services, :typeService_id, :type_service_id
  end
end

class NameTableService2 < ActiveRecord::Migration[6.0]
  def change
    rename_table :type_services_contrat_clients,:contrat_clients_type_services
  end
end

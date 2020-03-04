class NameTableService < ActiveRecord::Migration[6.0]
  def change
    rename_table :typesServices, :type_services
    rename_table :typesServices_contratClients, :type_services_contrat_clients
  end
end

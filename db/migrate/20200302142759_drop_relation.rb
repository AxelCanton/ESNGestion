class DropRelation < ActiveRecord::Migration[6.0]
  def change
    drop_table :contrat_clients_type_services
    change_table :contrat_clients do |t|
      t.belongs_to :type_services
    end
  end
end

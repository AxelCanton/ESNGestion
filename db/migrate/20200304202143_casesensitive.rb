class Casesensitive < ActiveRecord::Migration[6.0]
  def change
    rename_column :employes, :prenomE, :prenome
    rename_column :employes, :nomE, :nome
  end
end

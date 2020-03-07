class RemoveC < ActiveRecord::Migration[6.0]
  def change
    remove_column :employes, :reset_password_token
    remove_column :employes, :reset_password_sent_at
    remove_column :employes, :remember_created_at
    remove_column :employes, :authentication_token
    remove_column :employes, :created_at
    remove_column :employes, :updated_at
  end
end

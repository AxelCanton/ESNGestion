# frozen_string_literal: true

class DeviseCreate < ActiveRecord::Migration[6.0]
  def change
    change_table :employes do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at



      t.timestamps null: false
    end

    add_index :employes, :email,                unique: true
    add_index :employes, :reset_password_token, unique: true

  end
end

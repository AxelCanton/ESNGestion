class AddColEquipe < ActiveRecord::Migration[6.0]
  def change
    add_column:equipes, :nomEquipe, :string
  end
end

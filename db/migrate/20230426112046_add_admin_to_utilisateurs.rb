class AddAdminToUtilisateurs < ActiveRecord::Migration[6.1]
  def change
    add_column :utilisateurs, :admin, :boolean, :default => false
  end
end

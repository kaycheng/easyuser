class RenamePasswordEncryptedOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password_encrypted, :password_digest
  end
end

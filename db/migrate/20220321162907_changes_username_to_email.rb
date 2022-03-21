class ChangesUsernameToEmail < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :username, :string
    add_column :users, :email, :string
  end
end

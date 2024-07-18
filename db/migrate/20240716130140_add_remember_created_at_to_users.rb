class AddRememberCreatedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
  end
end

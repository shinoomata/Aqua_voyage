class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :email, null: false, default: ""
        t.string :encrypted_password, null: false, default: ""

        t.timestamps null: false
      end

      add_index :users, :email, unique: true
    end
  end
end
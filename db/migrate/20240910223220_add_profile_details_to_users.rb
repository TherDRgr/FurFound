class AddProfileDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_picture, :string
    add_column :users, :phone_number, :string
    add_column :users, :home_address, :string
    add_column :users, :account_number, :string
  end
end

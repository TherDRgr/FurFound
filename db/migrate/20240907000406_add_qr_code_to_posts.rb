class AddQrCodeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :qr_code, :string
  end
end

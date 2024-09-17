class AddQrCodeToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :qr_code, :string
  end
end

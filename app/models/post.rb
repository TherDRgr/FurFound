class Post < ApplicationRecord
    belongs_to :user
    validates :name, :color, :species, :breed, :last_seen_location, :date_reported, presence: true

    def qr_code_url
        # Customize the data you want to embed in the QR code
        qr_data = "Name: #{name}, Species: #{species}, Last Seen: #{last_seen_location}, Date: #{date_reported}"
    
        # Use the GOQR API to generate the QR code URL
        "https://api.qrserver.com/v1/create-qr-code/?data=#{URI.encode(qr_data)}&size=150x150"
    end
end

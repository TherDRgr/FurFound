# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding admin user..."

admin = User.find_or_initialize_by(email: "admin@test.com")
admin.name = "Admin"
admin.password = "furfoundadmin123!"
admin.password_confirmation = "furfoundadmin123!"
admin.role = 1  # Assuming role 1 is for Admin in your user model
admin.account_approval = true  # Assuming admin accounts are auto-approved
admin.save!

puts "Admin user (admin@test.com) created with password 'furfoundadmin123!'"

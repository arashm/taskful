# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: 'test@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.country = 'IE'
  user.city = 'Dublin'
end

user.tasks.find_or_create_by!(title: 'Buy groceries', description: 'Buy milk, eggs, and bread.', due_date: 6.day.from_now)


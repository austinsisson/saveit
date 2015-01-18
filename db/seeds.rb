require 'faker'
Faker::Config.locale = :en

User.destroy_all
Bookmark.destroy_all

# Create Users
5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(8),
    )
  user.skip_confirmation!
  user.save
end

users = User.all

# Create Bookmarks
20.times do
  Bookmark.create!(
    user:    users.sample,
    name:    Faker::Internet.url,
    topic:   "##{Faker::Lorem.word}",
    )
end
  
require 'faker'

#User.destroy_all
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
  bookmark = Bookmark.create!(
    user:    users.sample,
    url:    Faker::Internet.link,
    topic:   "##{Faker::Lorem.topic}",
    )
  site = LinkThumbnailer.generate('http://' << bookmark.url)
  bookmark.update(
    title:       site.title,
    description: site.description,
    favicon:     site.favicon,
    )
  bookmark.save
end
  
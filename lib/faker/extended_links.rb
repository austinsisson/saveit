class Faker::Internet < Faker::Base
  def self.link
    fetch('internet.link')
  end
end

class Faker::Lorem < Faker::Base
  def self.topic
    fetch('lorem.topic')
  end
end
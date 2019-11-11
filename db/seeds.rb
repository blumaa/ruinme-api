# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Relationship.destroy_all
Message.destroy_all

20.times do
    User.create(email: Faker::Internet.unique.email, password: Faker::Internet.password, display_name: Faker::TvShows::BojackHorseman.unique.character, age: rand(54), bio: Faker::TvShows::BojackHorseman.quote, gender: Faker::Coffee.blend_name, looking_for: "0101", zip_code: "60647" )
end

4.times do
  relationship = Relationship.new(pending: false)
  relationship.user_1 = User.all.sample
  relationship.user_2 = User.all.sample
  relationship.save
  puts relationship.errors.full_messages
end

10.times do
    relationship = Relationship.all.sample
    5.times do
      msg = relationship.messages.build(content: Faker::TvShows::BojackHorseman.tongue_twister)
      msg.sender = relationship.user_1
      msg.receiver = relationship.user_2
      msg.save
      puts msg.errors.full_messages
    end

end

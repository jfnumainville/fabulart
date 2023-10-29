# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "Creating users"
5.times do
  p user = User.create!(
    prompt_attempts_today: rand(1..51),
    last_prompt_attempt_date: Date.today
  )

  puts "Creating stories"
  3.times do
    p story = user.stories.create!(
      title: Faker::Book.title,
      style: ['horror', 'adventure', 'fantasy'].sample,
      image_prompt: Faker::Lorem.sentence(word_count: 3),
      image_url: Faker::Placeholdit.image(size: "1024x1024")
    )

    puts "Creating pages"
    3.times do |i|
      p story.pages.create!(
        page_number: i + 1,
        page_text: Faker::Lorem.paragraph(sentence_count: 10),
        image_prompt: Faker::Lorem.sentence(word_count: 3),
        image_url: Faker::Placeholdit.image(size: "1024x1024")
      )
    end
  end
end

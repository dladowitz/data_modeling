# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.destroy_all

authors = []
5.times do
  authors << Author.create(name: FFaker::Name.first_name)
  puts "Author Created: #{authors.last.name}"
end

authors.each do |author|
  5.times do
    book = author.books.create(title: FFaker::Skill.tech_skill)
    puts "Book Created: #{book.title}"

    chapter_numbers = rand 4..10
    reviews = rand 0..5

    chapter_numbers.times do |index|
      book.chapters.create number: index + 1
      puts "Chapter Created: #{book.chapters.last.number}"
    end

    reviews.times do
      book.reviews.create rating: rand(1..5), text: FFaker::CheesyLingo.words
      puts "Review Created: #{book.reviews.last.text}"
    end

  end
end

10.times do
  video = Video.create(name: FFaker::Skill.tech_skill)
  puts "Video Created: #{video.name}"
  reviews = rand 0..5

  reviews.times do
    video.reviews.create rating: rand(1..5), text: FFaker::CheesyLingo.words
    puts "Review Created: #{video.reviews.last.text}"
  end
end

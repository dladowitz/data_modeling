# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.delete_all

authors = []
10.times do
  authors << Author.create(name: FFaker::Name.first_name)
  puts "Author Created: #{authors.last.name}"
end

authors.each do |author|
  5.times do
    book = author.books.create(title: FFaker::Skill.tech_skill)
    chapter_numbers = rand 4..25
    chapter_numbers.times do |index|
      book.chapters.create number: index + 1
    end

    puts "Book Created: #{book.title}, Length: #{chapter_numbers} chapters"
  end
end

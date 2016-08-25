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

employees = [{name: "Money Bags", manager: true},{name: "Manny Manager", manager: false},{name: "Manny Manager", manager: false}]

employees.each do |employee_data|
  employee = Employee.create(name: employee_data[:name])
  unless employee_data[:manager]
    employee.manager_id = Employee.first.id
  end
  employee.save
  puts "Employee Created: #{employee.name}"

  employee.create_employment_history
  puts "Employment History Created"

  employee.employment_history.create_hiring_record(interview_date: Time.now, start_salary: 100000, start_date: 1.week.from_now)
  puts "Hiring Record Created"
end

10.times do
  order =  Order.create shipping_address: "5000 Main St", shipping_date: 1.week.from_now
  puts "Order Created: #{order.id}"

  rand(1..3).times do
    line_item = order.line_items.create(purchasable_type: "Book", purchasable_id: rand(1..Book.count), item_price: rand(100..2000), quantity: rand(1..5))
    puts "Line Item Created: #{line_item.purchasable_type}"
  end

  rand(0..3).times do
    line_item = order.line_items.create(purchasable_type: "Video", purchasable_id: rand(1..Video.count), item_price: rand(100..2000), quantity: rand(1..5))
    puts "Line Item Created: #{line_item.purchasable_type}"
  end
end

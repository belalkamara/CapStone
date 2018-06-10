require 'date'

1.times do |user|
  User.create!(
    email: "belalkamara@gmail.com", 
    name: "Belal Kamara", 
    password: "Sweetnovember", 
    password_confirmation: "Sweetnovember",
    roles: "site_admin"
    )
end

puts "1 Admin User Created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics Created"

10.times do |blog|
  Blog.create!(
    title: "Feet Pain #{blog}", 
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip", 
    picture: "http://via.placeholder.com/400x300",
    topic_id: Topic.last.id,
    user_id: User.last.id
  )
end

puts "10 blog posts"


6.times do |x|
  Activity.create!(
    title: "Week #{x}",
    description: "We need to run 10000 miles in 100 days.",
    miles: "10000",
    image: "http://via.placeholder.com/300x200",
    start_date: Date.new(2018, 10, 17),
    end_date: Date.new(2018, 10, 30),
    user_id: User.last.id
  )
end

1.times do |x|
  Activity.create!(
    title: "Week #{x}",
    description: "We need to run 100 miles in 20 days.",
    miles: "100",
    image: "http://via.placeholder.com/300x200",
    start_date: Date.new(2018, 04, 15),
    end_date: Date.new(2018, 10, 30),
    user_id: User.last.id
  )
end

puts "7 activities posts"

1.times do |x|
  Activity.last.types.create!(
    name: "Type #{x}"
  )
end

puts "1 Activity types created"
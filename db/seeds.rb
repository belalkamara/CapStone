require 'date'

1.times do |user|
  User.create!(
    email: "boom@test.com", 
    name: "BOOM BABY", 
    password: "testtest", 
    password_confirmation: "testtest",
    roles: "site_admin"
    )
end
puts "1 User Created"

1.times do |topic|
  Topic.create!(
    title: "Misc."
  )
end
puts "1 Topics Created"

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

1.times do |type|
  Type.create!(
    title: "Marathon"
  )
end
puts "1 Activity types created"


6.times do |x|
  Activity.create!(
    title: "Week #{x}",
    description: "We need to run 10000 miles in 100 days.",
    miles: "10000",
    image: "http://via.placeholder.com/300x200",
    start_date: Date.new(2018, 06, 17),
    end_date: Date.new(2018, 10, 30),
    user_id: User.last.id,
    type_id: Type.last.id
  )
end

1.times do |x|
  Activity.create!(
    title: "Didn't start yet",
    description: "We need to run 100 miles in 20 days.",
    miles: "100",
    image: "http://via.placeholder.com/300x200",
    start_date: Date.new(2018, 07, 15),
    end_date: Date.new(2018, 10, 30),
    user_id: User.last.id,
    type_id: Type.last.id
  )
end

1.times do |x|
  Activity.create!(
    title: "Ended Event",
    description: "We need to run 100 miles in 20 days.",
    miles: "100",
    image: "http://via.placeholder.com/300x200",
    start_date: Date.new(2018, 06, 01),
    end_date: Date.new(2018, 07, 03),
    user_id: User.last.id,
    type_id: Type.last.id
  )
end
puts "8 activities posts"

1.times do |user_log|
  UserLog.create!(user_id: User.last.id, miles: 3, day: (Date.today))
end
puts "1 user log have been created"

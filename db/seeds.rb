3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics Created"

10.times do |blog|
  Blog.create!(
    title: "Feet Pain #{blog}", 
    body: "UGH I HATE RUNNING", 
    picture: "http://via.placeholder.com/400x300",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts"


6.times do |x|
  Activity.create!(
    title: "Week #{x}",
    description: "We need to run 10000 miles in 100 days.",
    miles: "10000",
    image: "http://via.placeholder.com/300x200",
    days: "100"
  )
end

1.times do |x|
  Activity.create!(
    title: "Week #{x}",
    description: "We need to run 100 miles in 20 days.",
    miles: "100",
    image: "http://via.placeholder.com/300x200",
    days: "20"
  )
end

puts "7 activities posts"
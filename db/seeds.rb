10.times do |blog|
  Blog.create!(
    title: "Feet Pain #{blog}", 
    body: "UGH I HATE RUNNING", 
    picture: "http://via.placeholder.com/400x300"
  )
end

puts "10 blog posts"


3.times do |x|
  Activity.create!(
    title: "Week #{x}",
    miles: "20",
    image: "http://via.placeholder.com/300x200"
  )
end

puts "3 activities posts"
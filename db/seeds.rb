NUM_USERS = 10
NUM_CATEGORIES = 5
NUM_GIFS = NUM_CATEGORIES * 5
NUM_COMMENTS = NUM_GIFS * 5

(NUM_USERS).times do
  User.create(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password,
    about: Faker::Lorem.paragraph,
    url: Faker::Avatar.image
    )
end

["Race","Class","Adipositivity","Gender","Sexual Orientation"].each do |category|
  Category.create(
    name: category
    )
end

(NUM_GIFS).times do
  Gif.create(
    url: ["/gif_1.gif", "/gif_2.gif", "/gif_3.gif", "/gif_4.gif", "/gif_5.gif"].sample,
    caption: Faker::Lorem.sentence,
    category_id: rand(1..NUM_CATEGORIES),
    user_id: rand(1..NUM_USERS)
    )
end

(NUM_COMMENTS).times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    gif_id: rand(1..NUM_GIFS),
    user_id: rand(1..NUM_USERS)
    )
end
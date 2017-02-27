User.create! name: "admin", email: "admin@123.com",
  password: "123123", password_confirmation: "123123",
  isAdmin: true

User.create! name:  "admin2", email: "admin2@123.com",
  password: "123123", password_confirmation: "123123",
  isAdmin: true

Category.create! name: "Bread"

Dish.create! ([
  {name: "Pate", price: 12000,
    image_link: "http://bepyeu.com/wp-content/uploads/2015/09/lam-pate-gan-tai-nha.jpg",
    category_id: 1},
  {name: "Bread Recipes", price: 24000,
    image_link: "http://images.media-allrecipes.com/images/57796.jpg",
    category_id: 1},
  {name: "Utopia", price: 58000,
    image_link: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--2032_11.jpg?itok=TwmWws7z",
    category_id: 1},
  {name: "Smithfield Foods", price: 72000,
    image_link: "http://www.smithfieldfoods.com/images/home/packaged-brands/armour-food.jpg",
    category_id: 1},
  {name: "Browse Food Lists", price: 18000,
    image_link: "http://knowledgeoverflow.com/wp-content/uploads/2013/03/food_photography_burger_by_masterdev777-d3h1ryk.jpg",
    category_id: 1},
  {name: "Reader's Digest", price: 26000,
    image_link: "http://www.rd.com/wp-content/uploads/sites/2/2011/03/WORST-FOODS-YOU-CAN-EAT-03-sl.jpg",
    category_id: 1},
  {name: "Pate 2", price: 12000,
    image_link: "http://bepyeu.com/wp-content/uploads/2015/09/lam-pate-gan-tai-nha.jpg",
    category_id: 1},
  {name: "Bread Recipes 2", price: 24000,
    image_link: "http://images.media-allrecipes.com/images/57796.jpg",
    category_id: 1},
  {name: "Utopia 2", price: 58000,
    image_link: "http://bepyeu.com/wp-content/uploads/2015/09/lam-pate-gan-tai-nha.jpg",
    category_id: 1},
  {name: "Smithfield Foods 2", price: 72000,
    image_link: "http://www.smithfieldfoods.com/images/home/packaged-brands/armour-food.jpg",
    category_id: 1},
  {name: "Browse Food Lists 2", price: 18000,
    image_link: "http://knowledgeoverflow.com/wp-content/uploads/2013/03/food_photography_burger_by_masterdev777-d3h1ryk.jpg",
    category_id: 1},
  {name: "Reader's Digest 2", price: 26000,
    image_link: "http://www.rd.com/wp-content/uploads/sites/2/2011/03/WORST-FOODS-YOU-CAN-EAT-03-sl.jpg",
    category_id: 1}
])

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123123"
  User.create!(name: name,
    email: email, password: "123123",
    password_confirmation: password, isAdmin: false)
end
users = User.all.take 100
users.each do |user| 
  content = Faker::Lorem.sentence 5
  Review.create!(content: content,
    target_type: "User", target_id: user.id)
end

20.times do |n|
  Table.create!(description: "hihi",
    capacity: (n%4 + 1), table_code: (n + 1) )
end

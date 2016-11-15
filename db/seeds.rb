Area.create!(
    area_name: 'Da Nang'
  )
Location.create!(
    location_name: 'Quan Nhau',
    address: '123 nlb',
    area_id: 1,
    description: 'nhau everywhen',
    details: 'over night',
    owner_id: 1,
    user_id: 1,
  )
User.create!(
  name: "Quy",
  email: "quy@gmail.com",
  address: "Earth",
  birthday: "15/4/1995",
  sex: "Male",
  phone: "0935253027",
  password: "12312311",
  password_confirmation: "12312311",
  admin: false,
)
User.create!(
  name: "Triple Tee",
  email: "tien@framgia.com",
  address: "Earth",
  birthday: "1995/03/13",
  sex: "Male",
  phone: "0935253027",
  password: "12312311",
  password_confirmation: "12312311",
  admin: true,
)
50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@framgia.org"
  password = "123123"
  phone= 93525000 +n+1
  User.create!(
    name: name,
    email: email,
    address: "Galaxy",
    birthday: "1995/03/03",
    sex: "Male",
    phone: phone.to_s,
    password: password,
    admin: 0,
    password_confirmation: password,
  )
end
50.times do |n|
  title = Faker::Name.title
  content = Faker::Lorem.paragraph
  time = Faker::Time.between(DateTime.now - 1, DateTime.now)
  user = Faker::Number.between(1, 50)
  post = Post.create!(
    title: title,
    content: content,
    views: 50000.to_s,
    like: 200.to_s,
    dislike: 1000.to_s,
    user_id: user,
    location_id: 1,
    created_at: time,
    updated_at: time,
  )
  cmt = Comment.create!(
    user_id: user,
    post_id: post.id,
    comment: Faker::Lorem.paragraph(2),
    like: 0,
    dislike: 0,
    )
end

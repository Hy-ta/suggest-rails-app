User.create!(name: "sample1",
                 email: "sample1234@gmail.com",
                 password: "sample",
                 password_confirmation: "sample")
    39.times do |n|
      name = Faker::Name.name
      email ="sample123#{n+1}r@gmail.com"
      password= "sample"
      User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
    end   


  
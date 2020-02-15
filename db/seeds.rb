User.create!(name: "sample1",
                 email: "sample@sample",
                 password: "sample",
                 password_confirmation: "sample")
    39.times do |n|
      name = Faker::Name.name
      email ="sample#{n+1}@sample"
      password= "sample"
      User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
    end   


  
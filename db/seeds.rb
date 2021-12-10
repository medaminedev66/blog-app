# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_user = User.create(Name: 'Amine', Photo: 'https://thumbs.dreamstime.com/b/man-profile-cartoon-smiling-round-icon-vector-illustration-graphic-design-135443422.jpg', Bio: 'Full-Stack Developer with a love for JavaScript and React. Stack: Java, Ruby, ReactJs, Ruby on Rails, JavaScript. Open to new opportunities.')

second_user = User.create(Name: 'Dips', Photo: 'user photo', Bio: 'I am Dipesh Kumar, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')
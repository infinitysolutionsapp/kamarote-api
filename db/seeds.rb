# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create({username:"Rafael",password:"123456", email:"ferreira.rafaelc@gmail.com"})


# "Password can't be blank",
#         "Email can't be blank",
#         "Email is invalid",
#         "Username can't be blank",
#         "Password is too short (minimum is 6 characters)"
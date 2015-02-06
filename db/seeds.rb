# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "root",
             email: "root@root.com",
             role: "suppervisor",
             password:              "123456",
             password_confirmation: "123456")
User.create!(name:  "nvluan",
             email: "nvluan@gmail.com",
             role: "trainee",
             password:              "123456",
             password_confirmation: "123456")
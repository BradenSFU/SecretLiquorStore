# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(Username: 'admin', hashedpassword: $2a$10$xaN7fMCNDsX6ZCNthvp2BeimP95.NWuk8aKusxQX5rKrhmRofYTBq, saltedpassword: $2a$10$xaN7fMCNDsX6ZCNthvp2Be, Email: 'admin@admin.edu', Biography:'null',Isadmin:true)
#admin.toggle!(:admin)
=begin
username: admin
email: admin@admin.edu
password: theAdminzPa55w0rd
=end

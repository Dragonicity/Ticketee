# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed admin user

unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end

# Seed non-admin user

unless User.exists?(email: "viewer@ticketee.com")
  User.create!(email: "viewer@ticketee.com", password: "password")
end

# Seed sample projects

["Website", "Application", "AI Application"].each do | project |
  unless Project.exists?(name: project)
    Project.create!(name: project, description: "Sample project for #{project}")
  end
end

# Seed ticket states

unless State.exists?
  State.create(name: "New",     color: "#0066CC")
  State.create(name: "Open",    color: "#008000")
  State.create(name: "Closed",  color: "#990000")
  State.create(name: "Awesome", color: "#663399")
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@vane = Host.new(name: 'Vane', email: 'vane@me.com', :password '1234')
@rachel = Host.new(name: 'rachel', email: 'rachel@me.com', :password '1234')

@christian = Event.new(name: 'Christian Loefler' :description 'CL @ elsewhere' :date '08/03/18')

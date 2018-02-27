# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ name: 'Fred' }, { name: 'George' }, {name: "Ginny"}, {name: "Percy"}])
notes = Note.create([{ content: 'notes to George', user_id: 1 }, { content: 'note to Fred', user_id: 2 }])
note1 = Note.find(1)
note1.visible_to = "George, Ginny"
note2 = Note.find(2)
note2.visible_to = "Fred, Ginny, Percy"

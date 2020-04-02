# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Book.destroy_all
User.destroy_all

users = User.create! [
                         { name: 'Peter Parker', password_digest: 'abc123' },
                         { name: 'William Delos', password_digest: 'abc123' },
                         { name: 'Goodwill Hunting', password_digest: 'abc123' }
                     ]

Book.create! [
                 { title: 'The Mamba Mentality',
                   author: 'Kobe Bryant',
                   summary: 'Various skills and techniques used on the court by the late Los Angeles Lakers player.',
                   genre: 'hardcover-nonfiction',
                   isbn: '9780374201234',
                   user_id: users.sample.id
                 },
                 { title: 'Becoming',
                   author: 'Michelle Obama',
                   summary: 'The former first lady describes how she balanced work, family and her husband’s political ascent.',
                   genre: 'hardcover-nonfiction',
                   isbn: '9783641227326',
                   user_id: users.sample.id
                 }
             ]

becoming = Book.find_by(title: 'Becoming')
becoming.comments.create! [
                             { title: 'Wow', note: 'Good Stuff!' },
                             { title: 'Intriguing', note: 'Does not put you to sleep.' }
                         ]





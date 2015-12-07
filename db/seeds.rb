# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{first_name: 'Basel',last_name: 'Hashish',email:'basel.hashish@gmail.com',username:'BaselHashish'},
                    {first_name: 'mark',last_name: 'balbowa',email:'blah.blahblah@gmail.com',username:'Blahblah'}
                    ])
tweets = Tweet.create([{user_id: 1,tweet:'this is the first tweet',lat:31.123123213,lon:31.12321312312},
                      {user_id: 1,tweet:'this is the second tweet',lat:31.123123213,lon:31.12321312312},
                      {user_id: 2,tweet:'this is the third tweet',lat:31.123123213,lon:31.21321312312}])
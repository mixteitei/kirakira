# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!(
  [
    {email: "test@test", name: "楽山キラ子", password: "kirakira", image: File.open()},
    {email: "test2@test2", name: "喜太郎", password: "kirakira", image: File.open()},
    {email: "test3@test3", name: "星丸", password: "kirakira", image: File.open()},
    {email: "test4@test4", name: "MK-27", password: "kirakira", image: File.open()}
    ]
  )
  
  Diary.create!(
    [
      {body:"今日は同僚と山登りに行った！達成感すごい！", image: File.open(), user_id: users[0].id},
      {body:"父親の誕生日を家族でお祝いした。感謝を伝えられてよかった。", image: File.open(), user_id: users[1].id},
      {body:"会社の営業成績で表彰された！これからもがんばるぞ！", image: File.open(), user_id: users[2].id},
      {body:"今日は、自分お店を開いて1周年だった。良いお客さんに恵まれて幸せだなぁ。", image: File.open(), user_id: users[3].id},
      {body:, image: File.open(), user_id: users[0].id},
      {body:, image: File.open(), user_id: users[1].id},
      {body:, image: File.open(), user_id: users[2].id},
      {body:, image: File.open(), user_id: users[3].id},
      {body:, image: File.open(), user_id: users[0].id},
      {body:, image: File.open(), user_id: users[1].id},
      {body:, image: File.open(), user_id: users[2].id},
      {body:, image: File.open(), user_id: users[3].id},
      ]
    )
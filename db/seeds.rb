# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!(
  [
    {email: "test@test", name: "楽山キラ子", password: "kirakira", image: File.open("#{Rails.root}/db/fixtures/sample-user1.jpeg")},
    {email: "test2@test2", name: "喜太郎", password: "kirakira", image: File.open("#{Rails.root}/db/fixtures/sample-user2.jpeg")},
    {email: "test3@test3", name: "星丸", password: "kirakira", image: File.open("#{Rails.root}/db/fixtures/sample-user3.jpeg")},
    {email: "test4@test4", name: "MK-27", password: "kirakira", image: File.open("#{Rails.root}/db/fixtures/sample-user4.jpeg")}
    ]
  )
  
  Diary.create!(
    [
      {body: "今日は同僚と山登りに行った！達成感すごい！", image: File.open("#{Rails.root}/db/fixtures/sample-diary1.jpg"), user_id: users[0].id, created_at: Date.today},
      {body: "父親の誕生日を家族でお祝いした。感謝を伝えられてよかった。", image: File.open("#{Rails.root}/db/fixtures/sample-diary2.jpg"), user_id: users[1].id, created_at: Date.today},
      {body: "会社の営業成績で表彰された！これからもがんばるぞ！", image: File.open("#{Rails.root}/db/fixtures/sample-diary3.jpg"), user_id: users[2].id, created_at: Date.today},
      {body: "今日は、自分お店を開いて1周年だった。良いお客さんに恵まれて幸せだなぁ。", image: File.open("#{Rails.root}/db/fixtures/sample-diary4.jpg"), user_id: users[3].id, created_at: Date.today},
      {body: "筋トレ挑戦24日目！だんだん楽しくなってきた！", image: File.open("#{Rails.root}/db/fixtures/sample-diary5.jpg"), user_id: users[0].id, created_at: Date.yesterday},
      {body: "たまたま立ち寄ったカフェがめちゃくちゃよかった！常連になりそう！", image: File.open("#{Rails.root}/db/fixtures/sample-diary6.jpg"), user_id: users[1].id, created_at: Date.yesterday},
      {body: "今日から冬休み！やりたいことがたくさんだ！", image: File.open("#{Rails.root}/db/fixtures/sample-diary7.jpg"), user_id: users[2].id, created_at: Date.yesterday},
      {body: "数年ぶりに遊園地に行った。イルミネーションがすごい綺麗だった。また行きたいな。", image: File.open("#{Rails.root}/db/fixtures/sample-diary8.jpg"), user_id: users[3].id, created_at: Date.yesterday},
      {body: "めちゃくちゃ頑張って準備したプレゼンが大成功だった！頑張ったかいがあった！", image: File.open("#{Rails.root}/db/fixtures/sample-diary9.jpg"), user_id: users[0].id, created_at: Date.today - 2},
      {body: "今日から日記を書き始める！いい習慣にしたい。", image: File.open("#{Rails.root}/db/fixtures/sample-diary10.jpg"), user_id: users[1].id, created_at: Date.today - 2},
      {body: "３年ぶりに幼馴染と会ってきた。昔話に花が咲いた笑", image: File.open("#{Rails.root}/db/fixtures/sample-diary11.jpg"), user_id: users[2].id, created_at: Date.today - 2},
      {body: "ふと思ったけど、本当に人間関係に恵まれてる。感謝！", image: File.open("#{Rails.root}/db/fixtures/sample-diary12.jpg"), user_id: users[3].id, created_at: Date.today - 2}
      ]
    )
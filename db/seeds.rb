# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@test',
  password: '100100'
)

users = User.create!(
  [
    {email: 'ao@testuser', name: 'あお', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg"), child_information: '6歳の女の子・1歳の男の子', introduction: '仕事をしながら2人の母してます！'},
    {email: 'popo@testuser', name: 'ぽぽ', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg"), child_information: '4歳11ヶ月の女の子', introduction: '東京在住、4歳女の子ママです。'},
    {email: 'mari@testuser', name: 'まり', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg"), child_information: '2歳9カ月の男の子'},
    {email: 'hana@testuser', name: 'はな', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg"), child_information: '4歳9カ月の女の子・8歳の男の子'},
    {email: 'tomato@testuser', name: 'とまと', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg"), child_information: '5ヶ月の女の子・3歳10ヶ月の男の子', introduction: '先輩ママさんや同い年の子どもを持つママさんと情報共有できると嬉しいです♡'},
    {email: 'racco@testuser', name: 'らっこ', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg"), child_information: '1歳4ヶ月の女の子', introduction: 'R4.2.10♡'},
    {email: 'omochi@testuser', name: 'おもち', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg"), child_information: '4歳2ヶ月の双子の女の子', introduction: "同じ双子ママさんとたくさんお話できたら嬉しいです！\nよろしくお願いします。"},
    {email: 'yun@testuser', name: 'ゆん', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg"), child_information: '4ヶ月の女の子', introduction: 'よろしくお願いします。'},
    {email: 'ruru@testuser', name: 'るる', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg"), child_information: '4歳3か月の女の子・7歳の女の子', introduction: '姉妹ママです！'},
    {email: 'anpan@testuser', name: 'あんぱん', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg"), child_information: '7ヶ月の男の子・2歳6カ月の男の子'},
    {email: 'hiyoko@testuser', name: 'ひよこ', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg"), child_information: '1歳0ヶ月の男の子', introduction: 'よろしくお願いします。'},
    {email: 'potato@testuser', name: 'ポテト', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg"), child_information: '4歳の女の子', introduction: '仲良くしてください❣'},
    {email: 'poco@testuser', name: 'ぽこ', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg"), child_information: '3ヶ月の男の子'},
    {email: 'y@testuser', name: 'ｙ♡', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg"), child_information: '6歳の男の子・3歳6カ月の男の子・2ヶ月の女の子', introduction: '3人のママです。よろしくお願いします！'},
    {email: 'nene@testuser', name: 'ねね', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg"), child_information: '4歳の双子の男の子・2ヶ月の女の子', introduction: 'よろしくお願いします！'},
    {email: 'meron@testuser', name: 'めろん', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg"), child_information: '3歳6カ月の女の子'},
    {email: 'non@testuser', name: 'のん', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg"), child_information: '1ヶ月の女の子', introduction: 'よろしくお願いします。'},
    {email: 'mii@testuser', name: 'Mii', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user18.jpg"), filename:"sample-user18.jpg"), child_information: '2歳11カ月の男の子・5ヶ月の女の子', introduction: '初めまして♡'},
    {email: 'rin@testuser', name: 'りん', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user19.jpg"), filename:"sample-user19.jpg"), child_information: '6歳の男の子・4歳1カ月の男の子・9ヶ月の男の子', introduction: '3人兄弟のママです。よろしくお願いします！'},
    {email: 'ichigo@testuser', name: 'いちごみるく', password: '100100', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user20.jpg"), filename:"sample-user20.jpg"), child_information: '4歳6カ月の女の子・2歳2ヶ月の女の子'}
  ]
)

Post.create!(
  [
    {title: '近所の公園へ', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: "休日に近所の公園にお散歩に行きました。\n歩けるようになり、とても楽しめました。", user_id: users[0].id, category: 'trip' },
    {title: 'おもちゃの消毒', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), body: "みなさん、赤ちゃんのおもちゃ消毒は何を使われてますか？良ければ教えてください！", user_id: users[7].id, category: 'living' },
    {title: '旅行の時の哺乳瓶消毒', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: "旅行の時の哺乳瓶消毒って何でしてますか？", user_id: users[4].id, category: 'living' },
    {title: '今日の晩御飯', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), body: "今日の晩御飯はなににしますか？\nメニューが決まらなくて、、参考にしたいので教えてください！", user_id: users[2].id, category: 'food' },
    {title: '卵の離乳食', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), body: "卵を試しているのですが、卵黄まるまる1個はどのように調理されていますか？", user_id: users[4].id, category: 'food' },
    {title: 'スーパーで買うもの', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), body: "スーパーで頻繁に買うものを教えてください！\nいつも同じようなものばかり買ってしまうので、、、", user_id: users[2].id, category: 'living' },
    {title: '冷凍ブロッコリー', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), body: "冷凍ブロッコリーは電子レンジでチンするのと茹でるのだったらどちらがおいしくできますか？", user_id: users[1].id, category: 'food' },
    {title: '野菜嫌い', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), body: "野菜嫌いでも野菜がたっぷり取れるレシピありませんか？", user_id: users[3].id, category: 'food' },
    {title: 'ひとりで', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), body: "久しぶりに一人でお買い物♡一人だと気楽だな～", user_id: users[6].id, category: 'talk' },
    {title: '特売日', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"), body: "今日はスーパーの特売日！行ってきまーす！", user_id: users[2].id, category: 'talk' },
    {title: 'カフェ', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"), body: "今日は1人でカフェに行ってきました～", user_id: users[11].id, category: 'talk' },
    {title: 'ベビーカーにつける扇風機', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"), body: "手持ちの扇風機をベビーカーにつけるものはありますか？", user_id: users[19].id, category: 'trip' },
    {title: '夏のエアコン', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post13.jpg"), filename:"sample-post13.jpg"), body: "みなさんエアコンは朝までずっとつけてますか？", user_id: users[15].id, category: 'living' },
    {title: '夏休みの予定', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg"), body: "夏休み、みなさんは何をして過ごしますか？\n旅行の予定など知りたいです！", user_id: users[17].id, category: 'trip' },
    {title: '子連れ海外旅行', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post15.jpg"), filename:"sample-post15.jpg"), body: "子連れで海外旅行行った方いますか？\n何歳の時、どこに行きましたか？\n年末オーストラリアに行くか迷っています。", user_id: users[16].id, category: 'trip' },
    {title: '雨の日のお出かけ', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post16.jpg"), filename:"sample-post16.jpg"), body: "雨の日のベビーカーでのお出かけの時、皆さんは傘ですか？レインコートですか？", user_id: users[19].id, category: 'trip' },
    {title: 'お出かけの持ち物', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post17.jpg"), filename:"sample-post17.jpg"), body: "子供とお出かけする時の持ち物について教えてください。おむつ、おしりふき、おむつ替えシート、着替え、ガーゼ以外、何を持っていきますか？", user_id: users[19].id, category: 'trip' },
    {title: '夜ご飯のメニュー', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post18.jpg"), filename:"sample-post18.jpg"), body: "給食メニューと被らないように夜ご飯考えてますか？", user_id: users[14].id, category: 'food' },
    {title: '簡単で美味しい副菜', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post19.jpg"), filename:"sample-post19.jpg"), body: "簡単で美味しい副菜をたくさん教えてください！", user_id: users[16].id, category: 'food' },
    {title: '今日のご飯', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post20.jpg"), filename:"sample-post20.jpg"), body: "今日のご飯何にしますか？", user_id: users[14].id, category: 'food' }
  ]
)

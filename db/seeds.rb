# db/seeds.rb

Aquarium.create!(
  [
    {
      name: '沖縄美ら海水族館',
      location: '沖縄県国頭郡本部町字石川424',
      description: '沖縄美ら海水族館は、沖縄の海をテーマにした大型水族館で、世界最大級の水槽を誇ります。',
      website: 'https://churaumi.okinawa/' # 公式HPを追加
    },
    {
      name: '海遊館',
      location: '大阪府大阪市港区海岸通1丁目1-10',
      description: '海遊館は、大阪の天保山にある大型水族館で、環太平洋の生態系を再現しています。',
      website: 'https://www.kaiyukan.com/' # 公式HPを追加
    },
    {
      name: 'アクアパーク品川',
      location: '東京都港区高輪4丁目10-30',
      description: 'アクアパーク品川は、最新のデジタル技術を駆使した展示と、イルカショーが楽しめる都市型水族館です。',
      website: 'https://www.aqua-park.jp/' # 公式HPを追加
    },
    {
      name: 'サンシャイン水族館',
      location: '東京都豊島区東池袋3丁目1-3',
      description: 'サンシャイン水族館は、池袋のサンシャインシティ内にあり、都市のオアシスとして親しまれています。',
      website: 'https://www.sunshinecity.co.jp/aquarium/' # 公式HPを追加
    },
    {
      name: '名古屋港水族館',
      location: '愛知県名古屋市港区港町1-3',
      description: '名古屋港水族館は、南極圏の生態系を中心に展示し、シャチやイルカのショーが人気です。',
      website: 'https://www.nagoyaaqua.jp/' # 公式HPを追加
    }
  ]
)

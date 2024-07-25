# db/seeds.rb

# db/seeds.rb

Aquarium.create!(
  [
    {
      name: '沖縄美ら海水族館',
      location: '沖縄県国頭郡本部町字石川424',
      description: '沖縄美ら海水族館は、沖縄の海をテーマにした大型水族館で、世界最大級の水槽を誇ります。',
      website: 'https://churaumi.okinawa/',
      region: '沖縄'
    },
    {
      name: '海遊館',
      location: '大阪府大阪市港区海岸通1丁目1-10',
      description: '海遊館は、大阪の天保山にある大型水族館で、環太平洋の生態系を再現しています。',
      website: 'https://www.kaiyukan.com/',
      region: '近畿'
    },
    {
      name: 'アクアパーク品川',
      location: '東京都港区高輪4丁目10-30',
      description: 'アクアパーク品川は、最新のデジタル技術を駆使した展示と、イルカショーが楽しめる都市型水族館です。',
      website: 'https://www.aqua-park.jp/',
      region: '関東'
    },
    {
      name: 'サンシャイン水族館',
      location: '東京都豊島区東池袋3丁目1-3',
      description: 'サンシャイン水族館は、池袋のサンシャインシティ内にあり、都市のオアシスとして親しまれています。',
      website: 'https://www.sunshinecity.co.jp/aquarium/',
      region: '関東'
    },
    {
      name: 'あわしまマリンパーク',
      location: '静岡県沼津市内浦重寺186',
      description: 'あわしまマリンパークは、島全体がテーマパークになっており、カエル館や釣り体験も楽しめます。ユニークな生物展示が魅力です。',
      website: 'http://www.marinepark.jp/',
      region: '東海'
    },
    {
      name: '沼津港深海水族館',
      location: '静岡県沼津市千本港町83',
      description: '沼津港深海水族館は、深海生物の展示に特化しており、珍しい生物が観察できます。深海の神秘を感じられる展示が特徴です。',
      website: 'http://www.numazu-deepsea.com/',
      region: '東海'
    },
  {
    name: '下田海中水族館',
    location: '静岡県下田市3-22-31',
    description: '下田海中水族館は、自然の入り江を活かした展示が特徴で、イルカと一緒に泳げる体験が人気です。自然環境と調和した展示が魅力です。',
    website: 'http://www.shimoda-aquarium.com/',
    region: '東海'
  },
  {
    name: '東海大学海洋科学博物館',
    location: '静岡県静岡市清水区三保2389',
    description: '東海大学海洋科学博物館は、海洋科学の教育施設として、豊富な海洋生物と実験展示が充実しています。',
    website: 'https://www.umi.muse-tokai.jp/',
    region: '東海'
  },
  {
    name: '浜名湖体験学習施設 ウォット',
    location: '静岡県浜松市西区舞阪町弁天島5005-3',
    description: '浜名湖体験学習施設 ウォットは、浜名湖の自然環境を学べる展示が特徴で、体験学習プログラムが充実しています。',
    website: 'https://ulotto.entetsuassist-dms.com/',
    region: '東海'
  },
  {
    name: '時之栖アクアリウム（水中楽園 Aquarium）',
    location: '静岡県御殿場市神山719',
    description: '時之栖アクアリウムは、日本最大級の金魚水族館で、約200種4500匹の金魚が展示されています。光で彩られた幻想的な空間が特徴です。',
    website: 'https://www.tokinosumika.com/activity/aquarium/',
    region: '東海'
  },
  {
    name: 'ドルフィンファンタジー伊東',
    location: '静岡県伊東市宇佐美1826-1',
    description: 'ドルフィンファンタジーは、関東圏から最も近いイルカと遊べる施設で、イルカとの触れ合いや遊泳体験が楽しめます。',
    website: 'https://dolphin-fantasy.com/',
    region: '東海'
  },
  {
    name: '世界淡水魚園水族館 アクア・トトぎふ',
    location: '岐阜県各務原市川島笠田町1453',
    description: 'アクア・トトぎふは、世界各地の淡水魚を展示し、環境教育にも力を入れています。大きな川を再現した展示が見どころです。',
    website: 'https://aquatotto.com/',
    region: '東海'
  },
  {
    name: '匠の館森の水族館',
    location: '岐阜県高山市丹生川町根方532',
    description: '匠の館森の水族館は、山岳地域の淡水魚を展示し、伝統工芸品とのコラボレーション展示が特徴です。地域の文化と自然を融合させた展示が魅力です。',
    website: 'http://hida.net/aquarium.htm',
    region: '東海'
  },
  {
    name: '名古屋港水族館',
    location: '愛知県名古屋市港区港町1-3',
    description: '名古屋港水族館は、大型水槽でのイルカショーやシャチの展示が人気で、環境教育にも力を入れています。',
    website: 'https://www.nagoyaaqua.jp/',
    region: '東海'
  },
  {
    name: '竹島水族館',
    location: '愛知県蒲郡市竹島町1-6',
    description: '竹島水族館は、コンパクトながらも多彩な展示が特徴で、触れ合い体験やショーが人気です。',
    website: 'https://www.city.gamagori.lg.jp/site/takesui/',
    region: '東海'
  },
  {
    name: '碧南海浜水族館',
    location: '愛知県碧南市浜町2-3',
    description: '碧南海浜水族館は、地元の海洋生物を中心に展示し、家族連れに人気の施設です。',
    website: 'https://www.city.hekinan.lg.jp/aquarium/index.html',
    region: '東海'
  },
  {
    name: 'ぎょぎょランド（豊川市赤塚山公園）',
    location: '愛知県豊川市市田町東堤上1-30',
    description: 'ぎょぎょランドは、淡水魚の展示が充実しており、自然観察が楽しめる施設です。',
    website: 'https://www.city.toyokawa.lg.jp/shisetsu/koen/akatsukayama.html',
    region: '東海'
  },
  {
    name: '南知多ビーチランド',
    location: '愛知県知多郡美浜町奥田428-1',
    description: '南知多ビーチランドは、イルカやアシカのショーが人気で、触れ合い体験も充実しています。',
    website: 'https://www.beachland.jp/',
    region: '東海'
  },
  {
    name: 'シーライフ名古屋',
    location: '愛知県名古屋市港区金城ふ頭2-7-1',
    description: 'シーライフ名古屋は、テーマパーク内にある水族館で、家族連れに人気の施設です。',
    website: 'https://www.visitsealife.com/nagoya/',
    region: '東海'
  },
  {
    name: '新潟市水族館 マリンピア日本海',
    location: '新潟県新潟市中央区西船見町5932-445',
    description: '新潟市水族館 マリンピア日本海は、日本海に生息する生物を中心に展示し、イルカショーや触れ合い体験が人気です。特に大型のトンネル水槽が見どころです。',
    website: 'https://www.marinepia.or.jp/',
    region: '北陸'
  },
  {
    name: 'イヨボヤ会館',
    location: '新潟県村上市塩町13-34',
    description: 'イヨボヤ会館は、サケに特化した展示が特徴で、サケの生態や養殖の様子を学べます。施設内では実際にサケの遡上を観察することもできます。',
    website: 'http://www.iyoboya.jp/',
    region: '北陸'
  },
  {
    name: '長岡市寺泊水族博物館',
    location: '新潟県長岡市寺泊花立9353-158',
    description: '長岡市寺泊水族博物館は、地元の海洋生物を展示し、季節ごとの特別展示が行われます。特に冬季のクラゲ展示が見どころです。',
    website: 'https://aquarium-teradomari.jp/',
    region: '北陸'
  },
  {
    name: '上越市立水族博物館 うみがたり',
    location: '新潟県上越市五智2丁目15-15',
    description: '上越市立水族博物館 うみがたりは、雄大な日本海を望むロケーションで、ペンギンやクラゲの展示が充実しています。夜間のライトアップイベントも人気です。',
    website: 'https://umigatari.jp/',
    region: '北陸'
  },
  {
    name: '魚津水族館',
    location: '富山県魚津市三ケ1390',
    description: '魚津水族館は、日本で最も古い現存する水族館で、淡水魚や海水魚の多彩な展示が楽しめます。特に、地元の水生生物に焦点を当てた展示が人気です。',
    website: 'https://www.uozu-aquarium.jp/',
    region: '北陸'
  },
  {
    name: 'のとじま臨海公園水族館',
    location: '石川県七尾市能登島曲町15部40',
    description: 'のとじま臨海公園水族館は、イルカショーやペンギン展示が人気で、触れ合い体験も充実しています。特にイルカとのふれあいプログラムが家族連れに好評です。',
    website: 'https://www.notoaqua.jp/',
    region: '北陸'
  },
  {
    name: '越前松島水族館',
    location: '福井県坂井市三国町崎74-2-3',
    description: '越前松島水族館は、アザラシやペンギンのショーが見どころで、地元の海洋生物も豊富に展示されています。特に、海の自然を感じられる屋外展示が魅力です。',
    website: 'https://www.echizen-aquarium.com/',
    region: '北陸'
  },
  {
    name: '鳥羽水族館',
    location: '三重県鳥羽市鳥羽3-3-6',
    description: '鳥羽水族館は、日本最大級の淡水魚・海水魚の展示を誇る水族館で、ジュゴンやアシカのショーが人気です。',
    website: 'https://www.aquarium.co.jp/',
    region: '東海'
  },
  {
    name: '伊勢シーパラダイス',
    location: '三重県伊勢市二見町松下1343-1',
    description: '伊勢シーパラダイスは、触れ合い体験が充実した水族館で、アシカやカワウソとの近距離体験が人気です。',
    website: 'https://ise-seaparadise.com/',
    region: '東海'
  }
]


)

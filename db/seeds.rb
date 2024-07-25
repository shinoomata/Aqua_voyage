# db/seeds.rb

aquariums = [
    {
      name: '沖縄美ら海水族館',
      location: '沖縄県国頭郡本部町字石川424',
      description: '沖縄美ら海水族館は、沖縄の海をテーマにした大型水族館で、世界最大級の水槽を誇ります。',
      website: 'https://churaumi.okinawa/',
      region: '沖縄'
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
  },
  {
    name: 'アクアワールド茨城県大洗水族館',
    location: '茨城県東茨城郡大洗町磯浜町8252-3',
    description: 'アクアワールド茨城県大洗水族館は、日本トップクラスの規模を誇り、50種類以上のサメと日本一のマンボウ専用水槽があります。',
    website: 'https://www.aquaworld-oarai.com/',
    region: '関東'
  },
  {
    name: 'かすみがうら市水族館',
    location: '茨城県かすみがうら市坂910-1',
    description: 'かすみがうら市水族館は、霞ヶ浦に生息する魚や水辺の生物約100種類を飼育・展示しています。タッチ水槽やパノラマ展示が特徴です。',
    website: 'https://www.city.kasumigaura.lg.jp/page/page014376.html',
    region: '関東'
  },
  {
    name: 'なかがわ水遊園',
    location: '栃木県大田原市佐良土2686',
    description: 'なかがわ水遊園は、淡水魚の展示が中心で、関東に生息する淡水魚を観察することができます。',
    website: 'http://tnap.jp/',
    region: '関東'
  },
  {
    name: 'さかなと森の観察園',
    location: '栃木県日光市中宮祠2482',
    description: 'さかなと森の観察園は、中禅寺湖のほとりにあり、淡水魚の研究と展示を行う施設で、自然の中で魚を観察できます。',
    website: 'https://www.fra.go.jp/nikko/',
    region: '関東'
  },
  {
    name: '山梨県立富士湧水の里水族館',
    location: '山梨県南都留郡忍野村忍草3098-1',
    description: '山梨県立富士湧水の里水族館は、湧水に生息する魚を中心に展示し、特にメダカの種類が豊富です。湧水を利用したクリアな水槽が特徴です。',
    website: 'http://www.morinonakano-suizokukan.com/index.html',
    region: '関東'
  },
  {
    name: '蓼科アミューズメント水族館',
    location: '長野県茅野市北山4035-2409',
    description: '蓼科アミューズメント水族館は、高原の自然を活かした展示が特徴で、季節ごとのイベントも開催されます。自然体験と水族館の融合が魅力です。',
    website: 'https://www.tateshina-aquarium.jp/',
    region: '関東'
  },
  {
    name: '県営さいたま水族館',
    location: '埼玉県羽生市三田ヶ谷751-1',
    description: '県営さいたま水族館は、淡水魚専門の水族館で亀や山椒魚、水性昆虫の展示があります。外の池にはカワウソも飼育されています。',
    website: 'https://www.parks.or.jp/suizokukan/guide/001/001080.html',
    region: '関東'
  },
  {
    name: '鴨川シーワールド',
    location: '千葉県鴨川市東町1464-18',
    description: '鴨川シーワールドは、シャチやイルカのショーが大人気で、トロピカルアイランドではダイバー気分で南の海の水中散歩が楽しめます。',
    website: 'https://www.kamogawa-seaworld.jp/',
    region: '関東'
  },
  {
    name: '世界一ちっちゃな水族館',
    location: '千葉県銚子市潮見町15-9',
    description: '世界一ちっちゃな水族館は、19坪の小さなスペースにクラゲなどの海の生き物を展示するユニークな水族館です。',
    website: 'https://choshi-aquarium.jimdofree.com/',
    region: '関東'
  },
  {
    name: 'すみだ水族館',
    location: '東京都墨田区押上1-1-2 東京スカイツリータウン・ソラマチ5F・6F',
    description: 'すみだ水族館は、東京スカイツリータウンに位置し、仕切りのない水槽展示やスタッフとのコミュニケーションが魅力の水族館です。',
    website: 'https://www.sumida-aquarium.com/',
    region: '関東'
  },
  {
    name: 'マクセル アクアパーク品川',
    location: '東京都港区高輪4-10-30',
    description: 'マクセル アクアパーク品川は、品川駅から徒歩約2分の場所にあり、デジタルアートを駆使した展示空間とイルカのショーが見どころです。',
    website: 'https://www.aqua-park.jp/',
    region: '関東'
  },
  {
    name: 'サンシャイン水族館',
    location: '東京都豊島区東池袋3-1-3 サンシャインシティ',
    description: 'サンシャイン水族館は、“天空のオアシス”をコンセプトに、屋上にある非日常空間で多種多様な生き物が展示されています。',
    website: 'https://sunshinecity.jp/aquarium/',
    region: '関東'
  },
  {
    name: 'しながわ水族館',
    location: '東京都品川区勝島3-2-1',
    description: 'しながわ水族館は、「海と川とのふれあい」をコンセプトに、約450種4,000点の海の生き物たちを展示する本格水族館です。',
    website: 'http://www.aquarium.gr.jp/',
    region: '関東'
  },
  {
    name: '葛西臨海水族園',
    location: '東京都江戸川区臨海町6-2-3',
    description: '葛西臨海水族園は、1989年に開園し、建築面積11129平方メートル、総水量3,160トンを誇り、マグロの展示が見どころです。',
    website: 'https://www.tokyo-zoo.net/zoo/kasai/',
    region: '関東'
  },
  {
    name: '小笠原水産センター',
    location: '東京都小笠原村父島字清瀬',
    description: '小笠原水産センターは、小笠原諸島の海洋生物を中心に展示しており、独自の生態系を学べる施設です。',
    website: 'https://www.soumu.metro.tokyo.lg.jp/07ogasawara/fish/',
    region: '関東'
  },
  {
    name: '新江ノ島水族館',
    location: '神奈川県藤沢市片瀬海岸2-19-1',
    description: '新江ノ島水族館は、江の島と富士山をバックにイルカショーや相模湾大水槽が見どころで、遊びながら学べる水族館です。',
    website: 'https://www.enosui.com/',
    region: '関東'
  },
  {
    name: 'カワスイ 川崎水族館',
    location: '神奈川県川崎市川崎区日進町1-11',
    description: 'カワスイ 川崎水族館は、「世界の美しい水辺」をテーマに、多摩川からアマゾンまでの生き物を展示しています。',
    website: 'https://kawa-sui.com/',
    region: '関東'
  },
  {
    name: '横浜・八景島シーパラダイス',
    location: '神奈川県横浜市金沢区八景島',
    description: '横浜・八景島シーパラダイスは、テーマの異なる4つの水族館とさまざまなアトラクションがあり、一日中楽しめるテーマパークです。',
    website: 'https://www.seaparadise.co.jp/',
    region: '関東'
  },
  {
    name: '相模川ふれあい科学館 アクアリウムさがみはら',
    location: '神奈川県相模原市中央区水郷田名1-5-1',
    description: '相模川ふれあい科学館 アクアリウムさがみはらは、相模川に生息する淡水魚を展示し、全長40ｍの水槽「流れのアクアリウム」が見どころです。',
    website: 'https://sagamigawa-fureai.com/',
    region: '関東'
  },
  {
    name: '箱根園水族館',
    location: '神奈川県足柄下郡箱根町元箱根139',
    description: '箱根園水族館は、標高723メートルに位置し、世界中の魚450種類32,000匹が展示されています。ベーリング海のアザラシが見どころです。',
    website: 'https://www.princehotels.co.jp/amuse/hakone-en/suizokukan/',
    region: '関東'
  },
  {
    name: '横浜フォーチュンアクアリウム',
    location: '神奈川県横浜市中区山下町106-2',
    description: '横浜フォーチュンアクアリウムは、占いをテーマにした水族館で、“開運魚”を展示しています。訪れることで運気アップが期待できます。',
    website: 'https://fortune-aquarium.com/',
    region: '関東'
  },
  {
    name: '滋賀県立琵琶湖博物館',
    location: '滋賀県草津市下物町1091',
    description: '琵琶湖博物館は、琵琶湖の自然や生態系を展示しており、特に琵琶湖の固有種や淡水魚の展示が充実しています。',
    website: 'https://www.biwahaku.jp/',
    region: '近畿'
  },
  {
    name: '京都水族館',
    location: '京都府京都市下京区観喜寺町35-1',
    description: '京都水族館は、オオサンショウウオや京の里山を再現した展示が特徴で、内陸型の大規模水族館です。',
    website: 'https://www.kyoto-aquarium.com/',
    region: '近畿'
  },
  {
    name: '奈良金魚ミュージアム',
    location: '奈良県奈良市三条大路1丁目8-1',
    description: '奈良金魚ミュージアムは、日本最大級の金魚のミュージアムで、約3000匹の金魚を展示しています。アートと金魚のコラボレーションが特徴です。',
    website: 'https://kingyomuseum.com/',
    region: '近畿'
  },
  {
    name: 'アドベンチャーワールド',
    location: '和歌山県西牟婁郡白浜町堅田2399',
    description: 'アドベンチャーワールドは、動物園・水族館・遊園地が一体になったテーマパークで、イルカやクジラのショーが人気です。',
    website: 'https://www.aws-s.com/',
    region: '近畿'
  },
  {
    name: '京都大学白浜水族館',
    location: '和歌山県西牟婁郡白浜町459',
    description: '京都大学白浜水族館は、白浜周辺の無脊椎動物と魚を展示しており、カニやヒトデなど約500種が観察できます。',
    website: 'https://www.seto.kyoto-u.ac.jp/shirahama_aqua/',
    region: '近畿'
  },
  {
    name: '串本海中公園',
    location: '和歌山県東牟婁郡串本町有田1157',
    description: '串本海中公園は、日本で最初に指定された海中公園で、海中展望塔やウミガメパークが人気です。',
    website: 'https://www.kushimoto.co.jp/',
    region: '近畿'
  },
  {
    name: 'エビとカニの水族館',
    location: '和歌山県西牟婁郡すさみ町江住808-1',
    description: 'エビとカニの水族館は、エビとカニだけに特化したユニークな水族館で、世界中から集められた150種以上の甲殻類を展示しています。',
    website: 'https://ebikani-aquarium.com/',
    region: '近畿'
  },
  {
    name: 'くじらの博物館',
    location: '和歌山県東牟婁郡太地町太地2934-2',
    description: 'くじらの博物館は、鯨の生態や捕鯨に関する資料を展示しており、鯨のショーも楽しめます。世界一の規模を誇る鯨専門の博物館です。',
    website: 'http://www.kujirakan.jp/',
    region: '近畿'
  },
  {
    name: '海遊館',
    location: '大阪府大阪市港区海岸通1丁目1-10',
    description: '海遊館は、太平洋を中心に自然環境を再現し、ジンベエザメやイトマキエイを含む約620種3,000点の海洋生物を展示しています。',
    website: 'https://www.kaiyukan.com/',
    region: '近畿'
  },
  {
    name: '生きているミュージアム ニフレル',
    location: '大阪府吹田市千里万博公園2-1',
    description: 'ニフレルは、「感性にふれる」をコンセプトに、水族館と動物園、美術館を融合したアーティスティックな展示が特徴です。',
    website: 'https://www.nifrel.jp/',
    region: '近畿'
  },
  {
    name: '城崎マリンワールド',
    location: '兵庫県豊岡市瀬戸1090',
    description: '城崎マリンワールドは、ユニークなアトラクションやイルカ、アシカのショーが人気で、釣り体験も楽しめます。',
    website: 'https://marineworld.hiyoriyama.co.jp/',
    region: '近畿'
  },
  {
    name: '神戸須磨シーワールド',
    location: '兵庫県神戸市須磨区若宮町1丁目3-5',
    description: '神戸須磨シーワールドは、シャチとイルカのショーが特徴で、2024年6月にリニューアルオープンしました。',
    website: 'https://www.kobesuma-seaworld.jp/',
    region: '近畿'
  },
  {
    name: '姫路市立水族館',
    location: '兵庫県姫路市西延末440',
    description: '姫路市立水族館は、播磨地方の里地・里海の生き物を展示し、山頂付近に位置するため「山の上の水族館」としても知られています。',
    website: 'https://www.city.himeji.lg.jp/aqua/',
    region: '近畿'
  },
  {
    name: 'átoa（アトア）',
    location: '兵庫県神戸市中央区新港町7-2',
    description: 'アトアは、アクアリウムと舞台美術やデジタルアートの演出を融合させた新感覚の劇場型アクアリウムです。',
    website: 'https://atoa-kobe.jp/',
    region: '近畿'
  },
  {
    name: 'アクア東条',
    location: '兵庫県加東市黒谷1216',
    description: 'アクア東条は、淡水魚類の展示や釣り針製造工程の紹介があり、東条湖畔観光の合間に気軽に立ち寄れる癒しの空間です。',
    website: 'https://www.hyoturi.or.jp/aqua/',
    region: '近畿'
  }
]

aquariums.each do |aquarium|
  Aquarium.find_or_initialize_by(name: aquarium[:name], location: aquarium[:location]).tap do |a|
    a.description = aquarium[:description]
    a.website = aquarium[:website]
    a.region = aquarium[:region]
    a.save!
  end
end

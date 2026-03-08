-- ============================================================
-- 1. Create recipe_translations table
-- ============================================================
CREATE TABLE IF NOT EXISTS recipe_translations (
  id          SERIAL PRIMARY KEY,
  recipe_id   INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  locale      TEXT NOT NULL CHECK (locale IN ('en', 'ms', 'ja')),
  name        TEXT,
  description TEXT,
  history     TEXT,
  ingredients TEXT[],
  steps       TEXT[],
  UNIQUE (recipe_id, locale)
);

-- Index for fast locale lookups
CREATE INDEX IF NOT EXISTS idx_recipe_translations_lookup
  ON recipe_translations (recipe_id, locale);


-- ============================================================
-- 2. English translations (locale = 'en')
--    Fields: name, history
--    description / ingredients / steps → fallback to Malay
-- ============================================================

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(1, 'en', 'Nasi Lemak', 'Nasi Lemak is considered Malaysia''s national dish and has existed since the 19th century. The earliest written record appears in Sir Richard Olof Winstedt''s 1909 book "The Circumstances of Malay Life". Originally a breakfast dish for Malay farmers and fishermen in coastal villages, the rice was cooked in coconut milk and pandan leaves to produce a rich aroma and flavour. The dish evolved to be enjoyed at any time of day and is now served with various accompaniments including rendang, fried chicken, and squid. Nasi Lemak is not only beloved in Malaysia but has been recognised as one of the world''s greatest dishes.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(2, 'en', 'Teh Tarik', 'Teh Tarik, meaning "pulled tea", is an iconic Malaysian beverage that originated from the Indian Muslim (Mamak) immigrant community who arrived in Malaya during the 19th and early 20th centuries. The "pulling" technique — pouring tea repeatedly between two vessels from a height — was initially intended to cool the drink and create a frothy surface. Over time, this technique became an art form that drew crowds to mamak stalls. Teh Tarik was later proclaimed Malaysia''s unofficial national drink and is widely seen as a symbol of unity among the country''s diverse communities.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(3, 'en', 'Fried Flat Rice Noodles (Kuetiau Goreng)', 'Kuetiau Goreng originates from the cooking traditions of Teochew Chinese immigrants who arrived in Penang and Singapore during the 19th century. The flat rice noodles were originally sold by street hawkers cooking over heavy iron woks on open charcoal fires. The high heat technique — known as "wok hei" — remains the secret to its distinctive flavour. In Malaysia, Penang-style Kuetiau Goreng is world-renowned for its unique combination of prawns, cockles, bean sprouts, and chives in a dark, intensely flavoured sauce. It is now among the most popular street foods in the country.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(4, 'en', 'Cendol', 'Cendol is one of Southeast Asia''s oldest desserts, with records spanning over 800 years. Ancient Javanese manuscripts from the 12th and 13th centuries already mention this chilled treat. The name is believed to derive from the Javanese word "jendol" meaning "bump", referring to the distinctive pandan jelly strands. In Malaysia, Penang Cendol — served with rich palm sugar (gula Melaka) and thick coconut milk — has gained international recognition. Cendol is enjoyed across Southeast Asia in various regional forms and stands as a testament to the region''s ancient shared culinary heritage.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(5, 'en', 'Roti Canai', 'Roti Canai derives from the Indian paratha tradition, brought to Malaya by South Indian Muslim immigrants — particularly from Tamil Nadu (Chennai/Madras) — during the British colonial era in the 19th and early 20th centuries. The name "Canai" is believed to be a shortening of "Chennai". In the hands of Malaysian Mamak cooks, Roti Canai was refined into something unique: thinner, flakier, and crispier than its Indian original. Today it is Malaysia''s most popular breakfast, enjoyed with curry or dal. Its preparation is considered an art, with skilled cooks spinning the dough overhead to achieve its signature layers.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(8, 'en', 'Asam Laksa', 'Penang Asam Laksa — listed by CNN Travel among the world''s 50 best foods — has its roots in the Peranakan (Baba-Nyonya) culture that flourished in Penang and Melaka. This community, descendants of Chinese merchants who married local Malay women, blended Chinese and Malay culinary traditions into something wholly unique. The dish features thick noodles in a tangy fish-based broth made sour with asam gelugor (dried tamarind), combined with local herbs such as Vietnamese coriander, torch ginger flower, and shallots. It has been a staple of Penang street food for over a century and is one of Malaysia''s most distinctive culinary exports.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(9, 'en', 'Sate', 'Sate is believed to have originated in Java, Indonesia, before spreading across the Nusantara archipelago — including Malaya — through Javanese migration in the 19th century. The word "sate" may derive from the Tamil word "catai" meaning meat. In Malaysia, Kajang Sate in Selangor and Klang Valley Sate are celebrated for their rich peanut sauce and aromatic marinades. The technique of grilling spiced meat on bamboo skewers over charcoal is an ancient tradition passed down through generations. During the colonial era, Arab and Indian traders further influenced the spice blends used to marinate the meat, adding depth to Malaysia''s own sate identity.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(10, 'en', 'Rendang', 'Rendang originates from the Minangkabau people of West Sumatra, Indonesia, and spread to Malaya — particularly Negeri Sembilan — through Minang migration since the 15th century. The long cooking process, sometimes lasting four hours, originally served as a natural preservation method before refrigeration in the tropical climate. A fully dry rendang can last several weeks without spoiling. In 2011, CNN named Rendang the world''s number one most delicious food in its "World''s 50 Most Delicious Foods" list. It remains an essential dish during Hari Raya Aidilfitri and is one of the most globally recognised Malaysian culinary exports.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(11, 'en', 'Nasi Kerabu', 'Nasi Kerabu is a traditional dish originating from the east coast states of Kelantan and Terengganu. Its distinctive blue colour comes from butterfly pea flowers (bunga telang), a natural dye used in Malay cooking for centuries. The dish has its roots in Kelantanese royal palace culture, where it was once served exclusively to the nobility. The word "kerabu" refers to the fresh herbs and raw vegetables eaten alongside the rice, reflecting the deep connection between traditional Malay society and the natural landscape. Today Nasi Kerabu is a proud symbol of Kelantanese culinary identity, enjoyed across Malaysia.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(14, 'en', 'Apam Balik', 'Apam Balik — known as "Min Chiang Kueh" in Hokkien — is a Malaysian street pancake rooted in the Hokkien Chinese culinary tradition that evolved locally over generations. It is a Malaysian adaptation of the Chinese folded pancake, filled with crushed peanuts, sugar, and sweet corn. Two popular versions exist: the soft, thin variety and the thick, crispy version. The Malaysian iteration differs from its Chinese predecessor by using more batter and a richer filling. Apam Balik has become one of the most beloved street foods in Malaysia, transcending ethnic boundaries and enjoyed by all communities.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(16, 'en', 'Roti Jala', '"Net bread" — named for its lace-like pattern created by a special perforated mould — is a traditional Malay dish believed to have been influenced by Arab and Indian traders who passed through the Malay Peninsula over the centuries. The net pattern evokes the fishing nets used by coastal Malay communities. Roti Jala is most popular in Johor and the southern states of Malaysia, where it is traditionally served at wedding feasts and festive gatherings alongside rich chicken or meat curry. Its delicate, beautiful appearance makes it as much a visual spectacle as a culinary one.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(17, 'en', 'Nasi Dagang', 'Nasi Dagang is a traditional dish from Malaysia''s east coast, proudly claimed by both Terengganu and Kelantan. The word "dagang" means "trade" or "foreigner", and the dish is believed to have earned its name because it was sold to merchants who stopped at coastal ports. Cooked from a blend of glutinous and regular rice in coconut milk, it produces a uniquely rich, firm texture. Ikan tongkol (tuna) cooked in aromatic spices is the classic accompanying dish. Traditionally consumed as a breakfast, Nasi Dagang is a living symbol of the authentic east coast culinary identity.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(18, 'en', 'Otak-Otak', 'Otak-Otak is a spiced fish cake grilled inside banana or nipah palm leaves. It exists in two distinct Malaysian traditions: the Johor Bahru version, which is soft and creamy with strong Peranakan (Baba-Nyonya) influence, and the Penang version, which is grilled in nipah palm leaves giving it a smokier flavour. The name "otak-otak" means "brains" in Malay, referring to the soft, brain-like texture of the fish paste. The dish has been part of Malay and Peranakan fishing community culture for hundreds of years. The Muar, Johor variety has become an iconic food product recognised across the country.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(19, 'en', 'Kuih Seri Muka', 'Kuih Seri Muka is a traditional Malay and Peranakan layered kuih (cake) with a glutinous rice base topped by a smooth, glossy pandan custard layer. Its name translates as "beautiful face" in Malay, a fitting description for its elegant two-toned appearance. The kuih has a long history within Malay and Baba-Nyonya culinary culture, prepared for special occasions, feasts, and celebrations. The technique of cooking the two layers separately before combining them requires considerable skill and patience, making it a symbol of culinary craftsmanship in traditional Malaysian baking.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(21, 'en', 'Lemang', 'Lemang is glutinous rice cooked with coconut milk inside bamboo tubes lined with banana leaves, slowly roasted over an open charcoal fire. This ancient cooking method is believed to have been practised by Malay and Orang Asli communities across the Nusantara for centuries, long before the arrival of colonial powers. The process — which can take four to six hours — is traditionally performed by men during the Hari Raya Aidilfitri season. Lemang is best enjoyed with rendang or serunding. In Negeri Sembilan and Pahang, lemang is still cooked using traditional methods in kampung settings, making it a living piece of Malay cultural heritage.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(22, 'en', 'Kuih Lapis', 'Kuih Lapis is a colourful layered steamed cake with deep roots in both Peranakan and Malay culinary traditions, and variations of it are found across Southeast Asia. Made from rice flour, coconut milk, and sugar, each layer is individually steamed — a careful and patient process. The vivid alternating colours symbolise joy and celebration in local culture. In Malaysia, Kuih Lapis is a staple at major festivals including Hari Raya, Chinese New Year, and Deepavali, reflecting the multicultural spirit of the nation. Its rainbow layers have made it one of the most visually recognisable traditional Malaysian kuih.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(23, 'en', 'Ayam Percik', 'Ayam Percik is a traditional grilled chicken dish from Malaysia''s east coast, particularly Kelantan and Terengganu. It is distinguished by its rich coconut-based sauce, applied repeatedly to the chicken during grilling in a technique known as "percik" (basting). The dish is believed to have originated in the Kelantan royal courts, where it was prepared as a festive delicacy. The repeated basting creates a deeply caramelised, flavourful crust unique to this dish. Ayam Percik has since spread across Malaysia as one of the most representative dishes of authentic east coast Malay cuisine.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(24, 'en', 'Keropok Lekor', 'Keropok Lekor is a traditional fish snack from Terengganu that has become an icon of that state''s food culture. Made from fresh fish (typically selayang or tamban) mixed with sago and salt, it reflects the abundance of the fishing industry along the east coast. The name "lekor" in the Terengganu dialect means "to roll", describing the shaping process. Originally made by fishermen''s wives to make use of surplus catch, Keropok Lekor has since been granted Geographical Indication (GI) status as a heritage product of Terengganu. It is best enjoyed fresh, dipped in a chilli sauce.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(25, 'en', 'Nasi Tomato', 'Nasi Tomato is a fragrant rice dish cooked with tomatoes, aromatic spices, and rich broth, reflecting the strong influence of Indian Muslim (Mamak) cuisine on Malay cooking. It evolved from the "rice pilaf" tradition brought by Indian and Arab traders and immigrants to Malaya. The tomatoes replace part of the cooking liquid, giving the rice a warm reddish-gold colour and a subtly tangy flavour. Nasi Tomato is a mandatory dish at traditional Malay weddings, particularly in Johor, Selangor, and Melaka, where it is served alongside dalca, Ayam Masak Merah, and acar.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(26, 'en', 'Pisang Goreng', 'Pisang Goreng (fried banana fritters) is one of Malaysia''s oldest and most universal street foods. The tradition of battering and deep-frying bananas has been practised in the Malay world for centuries, with likely influence from Arab and Indian traders who used similar frying techniques in their own culinary traditions. Various banana varieties are used — raja, tanduk, and abu — each producing distinct textures and flavours. Pisang Goreng is an iconic roadside snack sold from Perlis to Johor, representing the simplicity and ingenuity of Malaysian kampung cooking, making the most of the country''s abundant tropical fruit.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(27, 'en', 'Kuih Ketayap', 'Kuih Ketayap — also known as Kuih Dadar or Kuih Gulung — is a traditional Malay and Peranakan crepe roll distinguished by its vivid green pandan skin, filled with sweetened grated coconut cooked in palm sugar. It has been closely tied to the Baba-Nyonya culture of Melaka and Penang for centuries, where it has long been prepared as a celebratory sweet. The skill of rolling the crepe neatly is a traditional art passed from mother to daughter. The naturally green skin, derived from fresh pandan juice with no artificial colouring, is a hallmark of authentic traditional Malaysian baking.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(28, 'en', 'Nasi Goreng Kampung', 'Nasi Goreng Kampung (Village Fried Rice) is the traditional Malay version of fried rice, rooted in the everyday life of Malaysian kampung (village) communities. Unlike more elaborate fried rice dishes, it uses humble pantry staples — dried anchovies, eggs, vegetables, and chili — reflecting the resourcefulness and creativity of rural Malay cooking. The practice of frying leftover rice from the night before is a wise, waste-reducing tradition. The use of belacan (fermented shrimp paste) and ikan bilis (dried anchovies) gives it a powerful umami flavour. Today, this simple dish is one of the most sought-after items on Malaysian restaurant menus for its honest, nostalgic taste.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(29, 'en', 'Sup Kambing', 'Sup Kambing (Mutton Soup) was brought to Malaya by Indian Muslim (Mamak) immigrants in the 19th century and has its roots in Mughal and Persian culinary traditions, which used warming spices such as cinnamon, cardamom, star anise, and cloves to cook meat. In Malaysia, the soup has been adapted with local ingredients including ginger, lemongrass, and curry leaves. It is a popular late-night dish at mamak stalls that operate 24 hours. During Ramadan, Sup Kambing becomes a much-loved dish to break fast. Its collagen-rich broth is also believed to have health benefits in traditional Malay and Indian herbal medicine.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(32, 'en', 'Rojak', 'Rojak is a vibrant fruit and vegetable salad that embodies Malaysia''s multicultural identity through its eclectic mix of ingredients. Two main versions exist in Malaysia: Malay-style Rojak with a sweet and spicy belacan dressing, and Chinese-style Rojak (Penang Rojak) featuring a thick, dark prawn paste sauce. The word "rojak" in Malay literally means "an uneven mixture", and the dish has become a national metaphor for Malaysia''s diverse yet harmonious society. CNN listed Penang Rojak among Asia''s top 50 foods. With roots over a century old in Penang''s Hokkien Chinese community, Rojak is a delicious symbol of unity in diversity.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(33, 'en', 'Kuih Bahulu', 'Kuih Bahulu is a traditional Malay sponge cake baked in special flower, fish, or star-shaped moulds. It is believed to have been influenced by Portuguese "bolo" cakes introduced during the Portuguese colonial period in Melaka in the 16th century — the word "Bahulu" or "Baulu" may itself derive from "bolo". Kuih Bahulu is an essential Hari Raya Aidilfitri treat, stored in glass jars to serve to visiting guests during the celebration. The traditional method of baking each piece individually in cast iron moulds over a wood fire is a fast-disappearing skill that is now considered a precious piece of living cultural heritage.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(34, 'en', 'Nasi Ulam', 'Nasi Ulam is a traditional Malay herb rice salad that embeds the ancient wisdom of traditional Malay herbal medicine (pengobatan) directly into everyday cooking. Fresh herbs — including Vietnamese coriander, turmeric leaves, kaffir lime leaves, pegaga (Asiatic pennywort), and young cashew leaves — are finely sliced and mixed into the rice, each ingredient chosen for both flavour and medicinal properties. Nasi Ulam is popular in Kelantan, Terengganu, and Perak, where local forests still yield an abundance of herbs. The dish is now attracting renewed interest due to the growing global appreciation for organic eating and plant-based wellness.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(40, 'en', 'Sambal Udang', 'Sambal Udang (Spicy Prawn Sambal) is a classic Malay prawn dish built on sambal — the chili paste that forms the foundation of Malay cooking. The use of chili in Malay cuisine only began after Portuguese traders introduced chilies to the Nusantara in the 16th century. Before that, black pepper and long pepper were used for heat. With the arrival of chili, sambal rapidly became the most important element in the Malay culinary repertoire. Sambal Udang combines two key products of the Malay maritime world — fresh prawns and belacan (fermented shrimp paste) — and remains a staple on Malay family dinner tables across all walks of life.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(41, 'en', 'Ayam Masak Merah', 'Ayam Masak Merah (Red-Cooked Chicken) is one of the most beloved dishes in Malay cuisine, featuring chicken braised in a rich tomato and chili sauce. The dish reflects Persian, Arab, and Indian influences on Malay cooking — particularly the use of tomatoes and warming spices such as cinnamon, star anise, and cloves. Its vivid red colour comes from the combination of chili paste and tomatoes cooked down to a thick, glossy sauce. Ayam Masak Merah is a mandatory dish at traditional Malay weddings, typically paired with Nasi Tomato. Its popularity crosses ethnic boundaries, and it is now enjoyed by all Malaysians as a favourite chicken dish.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(42, 'en', 'Pulut Panggang', 'Pulut Panggang (Grilled Glutinous Rice in Banana Leaf) is a traditional Malay snack made from glutinous rice cooked in coconut milk, filled with a spiced fish or prawn filling, wrapped in banana leaf, and grilled over charcoal. The dish has its roots in the coastal Malay fishing communities of Malaysia, where it was originally prepared as a durable, portable provision for fishermen heading out to sea. Grilling the banana leaf parcel imparts a distinctive smoky, herbal aroma. The Muar, Johor variety has become the most celebrated and is now the state''s most famous heritage food product.')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;


-- ============================================================
-- 3. Japanese translations (locale = 'ja')
--    Fields: name, history
-- ============================================================

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(1, 'ja', 'ナシレマ', 'ナシレマはマレーシアの国民食とされ、19世紀から存在しています。最も古い文献は1909年にサー・リチャード・オロフ・ウィンステッドが著した「マレー人の生活事情」に登場します。もともとは沿岸の村々に住むマレー系農民や漁師の朝食でした。ご飯はパンダンの葉とともにココナッツミルクで炊かれ、豊かな香りと風味を生み出します。今日では一日中いつでも楽しめる料理となり、ルンダン、フライドチキン、イカなど様々なおかずとともに提供されます。マレーシア国内だけでなく、世界最高の料理の一つとして国際的にも認められています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(2, 'ja', 'テタリ', 'テタリは「引いたお茶」を意味するマレーシアを象徴する飲み物で、19世紀から20世紀初頭にマレー半島へ移住したインド系ムスリム（ママ）移民コミュニティが起源です。高いところから二つの容器の間でお茶を繰り返し注ぐ「引く」技術は、もともと飲み物を冷やし泡立てるために考案されました。やがてこの技術はそれ自体が芸術となり、屋台の名物として人々を引きつけるようになりました。後にマレーシアの非公式国民飲料として宣言され、多様な民族が共存するマレーシア社会の団結の象徴とも見なされています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(3, 'ja', 'クェティアウゴレン', 'クェティアウゴレンは、19世紀にペナンとシンガポールへ移住した潮州系中国人移民の料理の伝統から生まれました。平たい米麺はもともと、炭火の上で重い鉄製の中華鍋を使う屋台の行商人によって売られていました。「鍋気（ウォックヘイ）」と呼ばれる強火の技術が独特の風味の秘訣です。マレーシアではペナンスタイルのクェティアウゴレンが世界的に有名で、エビ、アサリ、もやし、ニラを濃い色のソースで炒め合わせた唯一無二の一品です。今日ではマレーシアで最も人気のあるストリートフードの一つとなっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(4, 'ja', 'チェンドル', 'チェンドルは東南アジア最古のデザートの一つで、800年以上の歴史を誇ります。12〜13世紀の古代ジャワの写本にもこの冷たいデザートへの言及があります。その名はジャワ語の「ジェンドル（突起）」に由来するとされ、特徴的なパンダンゼリーの形状を指しています。マレーシアではパームシュガー（グラマラカ）と濃厚なココナッツミルクをたっぷりかけたペナン・チェンドルが国際的な名声を誇ります。チェンドルは東南アジア全域で各地域のバリエーションとともに親しまれており、古くから続く共通の食文化遺産の証です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(5, 'ja', 'ロティチャナイ', 'ロティチャナイはインドのパラタの伝統に由来し、英国植民地時代の19〜20世紀初頭にタミルナドゥ州（チェンナイ/マドラス）出身の南インド系ムスリム移民によってマレー半島にもたらされました。「チャナイ」という名前は「チェンナイ」の短縮形とされています。マレーシアのママック料理人の手によってロティチャナイは独自の進化を遂げ、インドのオリジナルよりも薄く、層が多く、カリッとした仕上がりになりました。現在ではマレーシアで最も人気の高い朝食で、カレーやダルとともに楽しまれます。生地を空中に投げて引き伸ばす技術はまさに職人芸です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(8, 'ja', 'アサムラクサ', 'ペナン・アサムラクサはCNNトラベルの「世界の50大料理」にも選ばれ、ペナンやマラッカで花開いたプラナカン（ババニョニャ）文化に起源を持ちます。中国系商人とマレー系女性の子孫であるこのコミュニティが、中国とマレーの料理の伝統を融合させた独自の味を生み出しました。太い麺を、アサムグルゴル（乾燥タマリンド）で酸味をつけた魚ベースのスープに入れ、ベトナムコリアンダー、トーチジンジャーフラワー、エシャロットなどの地元ハーブを加えます。100年以上にわたりペナンのストリートフードの定番であり、マレーシアを代表する食の文化財の一つです。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(9, 'ja', 'サテ', 'サテはジャワ島発祥とされ、19世紀のジャワ系移民の移住を通じてマレー半島を含むヌサンタラ全域に広まったと考えられています。「サテ」という言葉はタミル語の「カタイ（肉）」に由来するとも言われています。マレーシアではスランゴール州のカジャン産サテが豊かなピーナッツソースと芳醇なマリネで名高いです。香辛料で味付けした肉を竹串に刺し炭火で焼くという技法は、代々受け継がれてきた古くからの調理法です。植民地時代にはアラブ系・インド系の商人がスパイスブレンドに影響を与え、マレーシア独自のサテの個性に深みを加えました。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(10, 'ja', 'ルンダン', 'ルンダンはインドネシア西スマトラのミナンカバウ民族が起源で、15世紀以降のミナン系移民の移住を通じてマレーシア、特にヌグリスンビランに広まりました。長時間（時に4時間以上）かけて煮込む調理法は、冷蔵庫が存在しなかった熱帯の気候の中での天然の保存手段として機能していました。完全に乾燥させたルンダンは数週間保存可能です。2011年にCNNが発表した「世界の50大料理」でルンダンは第1位に輝きました。ハリラヤ・アイディルフィトリには欠かせない料理であり、世界で最も知られたマレーシア料理の一つです。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(11, 'ja', 'ナシクラブ', 'ナシクラブはマレーシア東海岸のクランタン州とトレンガヌ州に伝わる伝統料理です。その独特の青色はバタフライピーの花（ブンガテラン）から生まれ、この天然染料はマレー料理に何世紀にもわたって使用されてきました。この料理はかつてクランタン王室の宮廷文化に根ざし、貴族だけに提供される特別な料理でした。「クラブ」という言葉はご飯と一緒に食べる新鮮なハーブや生野菜を指し、伝統的なマレー社会と自然との深い結びつきを表しています。現在ナシクラブはクランタン料理のアイデンティティを象徴する料理として全国で楽しまれています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(14, 'ja', 'アパムバリ', 'アパムバリはホッケン語で「ミンチャンクエ」とも呼ばれ、マレーシアのストリートフード文化の中で独自の発展を遂げたホッケン系中国人の料理の伝統に根ざしています。中国の折りたたみパンケーキをマレーシア風にアレンジしたもので、砕いたピーナッツ、砂糖、コーンを詰めています。薄くて柔らかいタイプとぶ厚くてカリッとしたタイプの2種類が広く親しまれています。マレーシア版は中国のオリジナルより生地が多く使われ、フィリングが豊富です。アパムバリは民族を超えてすべてのマレーシア人に愛されるストリートフードとなっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(16, 'ja', 'ロティジャラ', '「網パン」とも訳されるロティジャラは、専用の穴あきモールドで作るレース状の模様が特徴的な伝統的なマレー料理で、何世紀にもわたってマレー半島を訪れたアラブ系・インド系の商人から影響を受けたと考えられています。網模様は沿岸のマレー漁師コミュニティが使う漁網を想起させます。ロティジャラはジョホール州と南部のマレーシア各州で特に人気が高く、結婚式や祝宴で濃厚なチキンカレーやミートカレーとともに伝統的に提供されます。その繊細で美しい見た目は視覚的にも楽しませてくれる料理です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(17, 'ja', 'ナシダガン', 'ナシダガンはマレーシア東海岸の伝統料理で、トレンガヌ州とクランタン州の両州が誇りを持って受け継いでいます。「ダガン」は「貿易」または「よそ者」を意味し、かつて沿岸の港に立ち寄る商人に売られていたことからその名が付いたと言われています。もち米と白米を混ぜてとともに炊いたご飯は、独特の豊かで固めの食感を生み出します。芳醇なスパイスで調理したカツオ（イカントンコル）が定番の付け合わせです。朝食として親しまれてきたナシダガンは、東海岸の本物の食文化アイデンティティの生きた象徴です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(18, 'ja', 'オタクオタ', 'オタクオタはバナナの葉またはニッパヤシの葉に包んで焼いた、スパイシーなすり身ケーキです。マレーシアには二つの異なる伝統があります。ジョホールバル版はなめらかでクリーミーな食感でプラナカン（ババニョニャ）の影響が強く、ペナン版はニッパヤシの葉で焼くため燻製に似た風味が加わります。「オタクオタ」というマレー語の名前は「脳みそ」を意味し、柔らかな脳のような食感のすり身に由来しています。この料理はマレーとプラナカンの漁師コミュニティで何百年もの歴史を持ちます。ジョホール州ムアル産のものが最も有名で、全国に知られる名物食品となっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(19, 'ja', 'クイスリムカ', 'クイスリムカはマレーとプラナカンの伝統的な二層の菓子（クイ）で、もち米のベースの上になめらかで光沢のあるパンダンカスタードが重なっています。その名前はマレー語で「美しい顔」を意味し、エレガントな二色の外観にふさわしい名称です。特別なお祝いや宴席、お祝いの場のためにマレーとババニョニャの食文化の中で長い歴史を持ちます。二つの層を別々に調理してから合わせる技術にはかなりの熟練と忍耐を要し、伝統的なマレーシアのお菓子づくりにおける職人技の象徴とされています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(21, 'ja', 'ルマン', 'ルマンはバナナの葉を敷いた竹筒の中にもち米とともにいれ、炭火でゆっくりと焼いた料理です。この古代的な調理法は植民地支配が到来するはるか以前から、マレー系とオラン・アスリのコミュニティによってヌサンタラ全域で実践されてきたと考えられています。4〜6時間かかるこの工程は、伝統的にハリラヤ・アイディルフィトリのシーズンに男性たちによって行われます。ルンダンやスルンドゥンと一緒に食べるのが最もおいしいとされています。ヌグリスンビラン州やパハン州では今もカンプン（村）の環境で伝統的な方法で作られ、マレー文化遺産の生きた一片となっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(22, 'ja', 'クイラピス', 'クイラピスはプラナカンとマレーの料理の伝統に深く根ざした鮮やかな層状の蒸し菓子で、東南アジア各地にバリエーションが見られます。米粉、ココナッツミルク、砂糖で作られ、一層ずつ丁寧に蒸す忍耐を要する工程で仕上げられます。鮮やかな交互の色は地元の文化において喜びと祝いの象徴です。マレーシアではハリラヤ、旧正月、ディーパバリといった主要な祭りに欠かせないお菓子で、多民族国家の精神を映し出しています。その虹のような層は、マレーシアで最も視覚的に印象的な伝統菓子の一つとして認識されています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(23, 'ja', 'アヤムペルチ', 'アヤムペルチはマレーシア東海岸、特にクランタン州とトレンガヌ州に伝わる伝統的なグリルチキン料理です。「ペルチ（バスティング）」と呼ばれるタレを繰り返し塗りながら焼く技法により、濃厚なのとカレー風味のソースが幾重にも重なります。この料理はクランタン王室の宮廷で生まれ、宮廷の宴のために用意された特別料理と考えられています。繰り返しのバスティングによって深くカラメル化した独特のコーティングが生まれ、他のグリルチキンとは一線を画す個性を持ちます。現在ではマレーシア東海岸の本格的なマレー料理を代表する一品として全国に広まっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(24, 'ja', 'クロポクルコル', 'クロポクルコルはトレンガヌ州の伝統的な魚のスナックで、同州の食文化のアイコンとなっています。新鮮な魚（セラヤン種やタンバン種が主）にサゴとを混ぜて作られ、東海岸の豊かな漁業産業の恩恵を反映しています。「ルコル」はトレンガヌ語で「巻く」を意味し、生地を棒状に成形する工程を指しています。もともとは漁師の妻たちが余剰の漁獲物を活用するために作ったもので、その後地理的表示（GI）の認定を受けトレンガヌの遺産的食品となりました。揚げたてを甘辛いチリソースと一緒に食べるのが最高の食べ方です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(25, 'ja', 'ナシトマト', 'ナシトマトはトマト、芳醇なスパイス、濃いスープで炊いた香り高いご飯料理で、マレー料理へのインド系ムスリム（ママ）料理の強い影響を反映しています。インドやアラブの商人・移民がマレー半島にもたらした「ピラフ」の伝統から発展しました。トマトが調理液の一部を置き換えることで、ご飯に温かみのある赤みがかった金色と軽くて酸味のある風味が生まれます。ナシトマトはジョホール、スランゴール、マラッカを中心とした伝統的なマレー式結婚披露宴に欠かせない料理で、ダルカ、アヤムマサメラ、アチャーとともに提供されます。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(26, 'ja', 'ピサンゴレン', 'ピサンゴレン（バナナフリッター）はマレーシアで最も古くから親しまれているストリートフードの一つです。バナナに衣をつけて揚げる伝統は、マレー世界で何世紀にもわたって受け継がれており、アラブやインドの商人が用いた揚げ物の技法からも影響を受けていると考えられています。ラジャ種、タンドゥク種、アブ種など様々なバナナが使われ、それぞれ異なる食感と風味をもたらします。ペルリスからジョホールまで全国で屋台販売されるピサンゴレンは、豊富な南国の果物を最大限に活かしたマレーシアのカンプン料理の知恵と素朴さの象徴です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(27, 'ja', 'クイクタヤ', 'クイクタヤ（クイダダルまたはクイグルンとも呼ばれる）はマレーとプラナカンの伝統的なクレープ菓子で、鮮やかな緑色のパンダン生地にパームシュガーで甘く煮たシュレッドココナッツを包んだものです。何世紀にもわたってマラッカとペナンのババニョニャ文化と深く結びついており、祝いのお菓子として長く受け継がれてきました。クレープをきれいに巻く技術は母から娘へと受け継がれる伝統の技です。人工着色料を一切使わず新鮮なパンダンジュースだけで生まれる自然の緑色は、本物の伝統的なマレーシアのお菓子の証です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(28, 'ja', 'ナシゴレンカンプン', 'ナシゴレンカンプン（村のチャーハン）はマレーシアのカンプン（村）コミュニティの日常生活に根ざしたマレー式のチャーハンです。より手の込んだ料理と異なり、乾燥アンチョビ、卵、野菜、唐辛子というありふれた食材を使い、農村のマレー料理の知恵と創造性を表しています。前夜の残りご飯を炒めるという習慣は、食物を無駄にしないための賢い伝統です。ブラチャン（発酵エビペースト）とイカンビリス（乾燥アンチョビ）を使うことで力強いうまみが生まれます。今日この素朴な料理は、その正直で懐かしい味わいからマレーシアのレストランで最も注文される料理の一つとなっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(29, 'ja', 'スップカンビン', 'スップカンビン（マトンスープ）は19世紀にインド系ムスリム（ママ）移民によってマレー半島にもたらされ、シナモン、カルダモン、八角、クローブなどの温かみのあるスパイスで肉を調理するムガル・ペルシャ料理の伝統に起源を持ちます。マレーシアではショウガ、レモングラス、カレーリーフを使い、地元風にアレンジされています。24時間営業のママ屋台で人気の深夜料理です。ラマダン中はスップカンビンが断食明けの食事として非常に喜ばれます。コラーゲンが豊富なスープは伝統的なマレーとインドのハーブ医学でも健康上の効能があるとされています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(32, 'ja', 'ロジャ', 'ロジャは果物と野菜の活気あるサラダで、折衷的な食材の組み合わせを通じてマレーシアの多文化的アイデンティティを体現しています。マレーシアには主に二つのバージョンが存在します。マレー式はベラチャン（エビペースト）を使った甘辛いドレッシングで、中国式（ペナンロジャ）は濃厚な黒い海老ペーストのソースが特徴です。「ロジャ」というマレー語は文字通り「不均一な混合」を意味し、この料理はマレーシアの多様でありながら調和のとれた社会の隠喩となっています。CNNはペナンロジャをアジアのトップ50料理に選出。ペナンのホッケン系中国人コミュニティに100年以上の歴史を持つロジャは、多様性の中の団結を象徴するおいしい料理です。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(33, 'ja', 'クイバフル', 'クイバフルは花、魚、星の形をした特製型で焼くマレーの伝統的なスポンジケーキです。16世紀のポルトガル植民地時代のマラッカにおけるポルトガルの「ボロ」ケーキから影響を受けたと考えられており、「バフル」または「バウル」という名前自体が「ボロ」に由来するのかもしれません。クイバフルはハリラヤ・アイディルフィトリに欠かせないお菓子で、ガラスの瓶に入れてお客様へのおもてなしとして提供されます。木炭の火でひとつひとつ鋳鉄型で焼く伝統的な製法は急速に失われつつある技術で、現在では貴重な生きた文化遺産とみなされています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(34, 'ja', 'ナシウラム', 'ナシウラムはマレーの伝統的なハーブ入りご飯サラダで、伝統的なマレーのハーブ医学（プンゴバタン）の古代の知恵を日常料理に直接取り込んだものです。ベトナムコリアンダー、ウコンの葉、コブミカンの葉、ペガガ（ツボクサ）、若いカシューの葉など新鮮なハーブが細かく刻んでご飯と混ぜられ、それぞれの食材が風味と薬効のために選ばれています。ナシウラムはクランタン、トレンガヌ、ペラクで特に人気があり、地域の森林が今もハーブを豊かに提供しています。オーガニック食や植物性ウェルネスへの関心が世界的に高まる中、この料理は再び注目を集めています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(40, 'ja', 'サンバルウダン', 'サンバルウダン（スパイシーエビサンバル）はマレー料理の基盤であるサンバル（チリペースト）をベースにした古典的なエビ料理です。マレー料理へのチリの使用は16世紀にポルトガルの商人がヌサンタラにチリをもたらして初めて始まりました。それ以前は黒こしょうや長こしょうが辛みのために使われていました。チリの到来とともにサンバルはマレーの料理のレパートリーの中で最も重要な要素となりました。サンバルウダンは新鮮なエビとブラチャン（発酵エビペースト）というマレーの海の恵みを組み合わせ、あらゆる層のマレーシア人家族の食卓に欠かせない定番料理であり続けています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(41, 'ja', 'アヤムマサメラ', 'アヤムマサメラ（レッドクックドチキン）はマレー料理の中で最も愛される料理の一つで、チキンをトマトと唐辛子の濃厚なソースで煮込んだものです。ペルシャ、アラブ、インドのマレー料理への影響を反映しており、特にシナモン、八角、クローブなどのスパイスとトマトの使用に表れています。チリペーストとトマトを煮詰めることで生まれる鮮やかな赤色の光沢あるソースが特徴です。アヤムマサメラは伝統的なマレーの結婚披露宴に欠かせない料理で、通常ナシトマトとともに提供されます。その人気は民族の垣根を超え、今ではすべてのマレーシア人に愛されるチキン料理の定番となっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

INSERT INTO recipe_translations (recipe_id, locale, name, history) VALUES
(42, 'ja', 'プルットパンガン', 'プルットパンガンはバナナの葉に包んだもち米を炭火で焼いたマレーの伝統的なスナックで、ご飯はあらかじめ風味豊かなスパイスを効かせた魚や海老のフィリングとともにまとめられています。この料理はマレーシア沿岸の漁師コミュニティに起源を持ち、もともとは漁師が沖へ出る際の持ち帰り食料として準備されていました。バナナの葉に包んで炭火で焼くことで、独特のスモーキーでハーブのような香りが加わります。ジョホール州ムアル産のものが最も有名で、現在は同州で最も名高い遺産的食品となっています。')
ON CONFLICT (recipe_id, locale) DO UPDATE SET name = EXCLUDED.name, history = EXCLUDED.history;

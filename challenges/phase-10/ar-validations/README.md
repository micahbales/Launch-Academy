[1] pry(main)> r = Recipe.new
=> #<Recipe:0x007f8f1b2880f0 id: nil, name: nil, description: nil, deliciousness_rating: nil, created_at: nil, updated_at: nil, serving: nil>
[2] pry(main)> r.name = "some sprouties"
=> "some sprouties"
[3] pry(main)> r.save
D, [2016-09-29T22:56:40.056959 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T22:56:40.070556 #21655] DEBUG -- :   Recipe Exists (0.6ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'some sprouties' LIMIT 1
D, [2016-09-29T22:56:40.083952 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[4] pry(main)> Recipe.last
D, [2016-09-29T22:57:03.417028 #21655] DEBUG -- :   Recipe Load (0.5ms)  SELECT  "recipes".* FROM "recipes"  ORDER BY "recipes"."id" DESC LIMIT 1
=> #<Recipe:0x007f8f1ba0dbe0
 id: 5,
 name: "Beef Sprouts",
 description: "grilled brussels sprouts served atop a bed of sliced steak",
 deliciousness_rating: 9,
 created_at: 2016-09-29 16:27:10 UTC,
 updated_at: 2016-09-29 16:27:10 UTC,
 serving: nil>
[5] pry(main)> s = Recipe.new
=> #<Recipe:0x007f8f1ac966d8 id: nil, name: nil, description: nil, deliciousness_rating: nil, created_at: nil, updated_at: nil, serving: nil>
[6] pry(main)> s.name = "rowdy brussels sprouts"
=> "rowdy brussels sprouts"
[7] pry(main)> s.save
D, [2016-09-29T22:57:38.814340 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T22:57:38.815325 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'rowdy brussels sprouts' LIMIT 1
D, [2016-09-29T22:57:38.816159 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[8] pry(main)> r.description = "they are delicious"
=> "they are delicious"
[9] pry(main)> r
=> #<Recipe:0x007f8f1b2880f0
 id: nil,
 name: "some sprouties",
 description: "they are delicious",
 deliciousness_rating: nil,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[10] pry(main)> r.save
D, [2016-09-29T22:58:29.685488 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T22:58:29.686358 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'some sprouties' LIMIT 1
D, [2016-09-29T22:58:29.687368 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[11] pry(main)> r.deliciousness_rating = 7
=> 7
[12] pry(main)> r.save
D, [2016-09-29T22:58:44.299536 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T22:58:44.300367 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'some sprouties' LIMIT 1
D, [2016-09-29T22:58:44.301434 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[13] pry(main)> r
=> #<Recipe:0x007f8f1b2880f0
 id: nil,
 name: "some sprouties",
 description: "they are delicious",
 deliciousness_rating: 7,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[14] pry(main)> r.save
D, [2016-09-29T22:59:23.960684 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T22:59:23.961666 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'some sprouties' LIMIT 1
D, [2016-09-29T22:59:23.962789 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[15] pry(main)> r.serving = 1
=> 1
[16] pry(main)> r
=> #<Recipe:0x007f8f1b2880f0
 id: nil,
 name: "some sprouties",
 description: "they are delicious",
 deliciousness_rating: 7,
 created_at: nil,
 updated_at: nil,
 serving: 1>
[17] pry(main)> r.save
D, [2016-09-29T23:00:07.600457 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:00:07.601290 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'some sprouties' LIMIT 1
D, [2016-09-29T23:00:07.602075 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[18] pry(main)> Recipe.last
D, [2016-09-29T23:00:20.769908 #21655] DEBUG -- :   Recipe Load (0.4ms)  SELECT  "recipes".* FROM "recipes"  ORDER BY "recipes"."id" DESC LIMIT 1
=> #<Recipe:0x007f8f1c10c428
 id: 5,
 name: "Beef Sprouts",
 description: "grilled brussels sprouts served atop a bed of sliced steak",
 deliciousness_rating: 9,
 created_at: 2016-09-29 16:27:10 UTC,
 updated_at: 2016-09-29 16:27:10 UTC,
 serving: nil>
[19] pry(main)> five = Recipe.last
D, [2016-09-29T23:00:36.694823 #21655] DEBUG -- :   Recipe Load (0.3ms)  SELECT  "recipes".* FROM "recipes"  ORDER BY "recipes"."id" DESC LIMIT 1
=> #<Recipe:0x007f8f1aabd0f0
 id: 5,
 name: "Beef Sprouts",
 description: "grilled brussels sprouts served atop a bed of sliced steak",
 deliciousness_rating: 9,
 created_at: 2016-09-29 16:27:10 UTC,
 updated_at: 2016-09-29 16:27:10 UTC,
 serving: nil>
[20] pry(main)> five.serving = 4
=> 4
[21] pry(main)> five
=> #<Recipe:0x007f8f1aabd0f0
 id: 5,
 name: "Beef Sprouts",
 description: "grilled brussels sprouts served atop a bed of sliced steak",
 deliciousness_rating: 9,
 created_at: 2016-09-29 16:27:10 UTC,
 updated_at: 2016-09-29 16:27:10 UTC,
 serving: 4>
[22] pry(main)> g = Recipe.create(name: "Chicken Brussels Sprouts", description: "So much good chicken deliciousness", deliciousness_rating: 8, serving: 7)
D, [2016-09-29T23:03:10.145624 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:03:10.146674 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Chicken Brussels Sprouts' LIMIT 1
D, [2016-09-29T23:03:10.148365 #21655] DEBUG -- :   SQL (0.3ms)  INSERT INTO "recipes" ("name", "description", "deliciousness_rating", "serving", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["name", "Chicken Brussels Sprouts"], ["description", "So much good chicken deliciousness"], ["deliciousness_rating", 8], ["serving", 7], ["created_at", "2016-09-30 03:03:10.146929"], ["updated_at", "2016-09-30 03:03:10.146929"]]
D, [2016-09-29T23:03:10.150054 #21655] DEBUG -- :    (1.3ms)  COMMIT
=> #<Recipe:0x007f8f1b190da0
 id: 6,
 name: "Chicken Brussels Sprouts",
 description: "So much good chicken deliciousness",
 deliciousness_rating: 8,
 created_at: 2016-09-30 03:03:10 UTC,
 updated_at: 2016-09-30 03:03:10 UTC,
 serving: 7>
[23] pry(main)> g = Recipe.create(name: "Chicken Brussels Sprouts", description: "So much good chicken deliciousness", deliciousness_rating: 8)
D, [2016-09-29T23:03:32.346178 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:03:32.347187 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Chicken Brussels Sprouts' LIMIT 1
D, [2016-09-29T23:03:32.348368 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1b86fc20
 id: nil,
 name: "Chicken Brussels Sprouts",
 description: "So much good chicken deliciousness",
 deliciousness_rating: 8,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[24] pry(main)> g = Recipe.create(name: "Chicken Brussels Sprouts - with gasoline!", description: "Gross!", deliciousness_rating: 1)
D, [2016-09-29T23:04:17.819833 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:04:17.820686 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Chicken Brussels Sprouts - with gasoline!' LIMIT 1
D, [2016-09-29T23:04:17.821495 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1a8e2d48
 id: nil,
 name: "Chicken Brussels Sprouts - with gasoline!",
 description: "Gross!",
 deliciousness_rating: 1,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[25] pry(main)> g = Recipe.create(name: "Chicken Brussels with Anchovies", description: "Gross!", deliciousness_rating: 1)
D, [2016-09-29T23:05:17.684690 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:05:17.685580 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Chicken Brussels with Anchovies' LIMIT 1
D, [2016-09-29T23:05:17.686706 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1b54d268
 id: nil,
 name: "Chicken Brussels with Anchovies",
 description: "Gross!",
 deliciousness_rating: 1,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[26] pry(main)> g = Recipe.create(name: "Raw Brussels Sprouts", description: "Gross!", deliciousness_rating: 1)
D, [2016-09-29T23:05:33.350339 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:05:33.351235 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Raw Brussels Sprouts' LIMIT 1
D, [2016-09-29T23:05:33.352047 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1b9fe168 id: nil, name: "Raw Brussels Sprouts", description: "Gross!", deliciousness_rating: 1, created_at: nil, updated_at: nil, serving: nil>
[27] pry(main)> a = Recipe.create(name: "Raw Brussels Sprouts", description: "Yuck!", deliciousness_rating: 2)
D, [2016-09-29T23:06:01.903755 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:06:01.904569 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Raw Brussels Sprouts' LIMIT 1
D, [2016-09-29T23:06:01.905374 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1ac8f658 id: nil, name: "Raw Brussels Sprouts", description: "Yuck!", deliciousness_rating: 2, created_at: nil, updated_at: nil, serving: nil>
[28] pry(main)> Recipe.first
D, [2016-09-29T23:06:18.551243 #21655] DEBUG -- :   Recipe Load (0.4ms)  SELECT  "recipes".* FROM "recipes"  ORDER BY "recipes"."id" ASC LIMIT 1
=> #<Recipe:0x007f8f1ac1cec8
 id: 1,
 name: "Almond Sprouts",
 description: "roasted brussels sprouts with almonds",
 deliciousness_rating: 7,
 created_at: 2016-09-29 16:13:39 UTC,
 updated_at: 2016-09-29 16:13:39 UTC,
 serving: nil>
[29] pry(main)> Recipe.last
D, [2016-09-29T23:06:23.072775 #21655] DEBUG -- :   Recipe Load (0.4ms)  SELECT  "recipes".* FROM "recipes"  ORDER BY "recipes"."id" DESC LIMIT 1
=> #<Recipe:0x007f8f1b4ac958
 id: 6,
 name: "Chicken Brussels Sprouts",
 description: "So much good chicken deliciousness",
 deliciousness_rating: 8,
 created_at: 2016-09-30 03:03:10 UTC,
 updated_at: 2016-09-30 03:03:10 UTC,
 serving: 7>
[30] pry(main)> a = Recipe.create(name: "Raw Brussels Sprouts", description: "Not so hot", deliciousness_rating: 3)
D, [2016-09-29T23:07:38.761958 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:07:38.762910 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Raw Brussels Sprouts' LIMIT 1
D, [2016-09-29T23:07:38.763705 #21655] DEBUG -- :    (0.1ms)  ROLLBACK
=> #<Recipe:0x007f8f1b445118
 id: nil,
 name: "Raw Brussels Sprouts",
 description: "Not so hot",
 deliciousness_rating: 3,
 created_at: nil,
 updated_at: nil,
 serving: nil>
[31] pry(main)> z = Recipe.create(name: "Hamburger Deluxe", description: "nothing to do with sprouts", deliciousness_rating: 6)
D, [2016-09-29T23:08:25.330668 #21655] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:08:25.331458 #21655] DEBUG -- :   Recipe Exists (0.3ms)  SELECT  1 AS one FROM "recipes" WHERE "recipes"."name" = 'Hamburger Deluxe' LIMIT 1
D, [2016-09-29T23:08:25.332530 #21655] DEBUG -- :    (0.2ms)  ROLLBACK
=> #<Recipe:0x007f8f1ab8de80
 id: nil,
 name: "Hamburger Deluxe",
 description: "nothing to do with sprouts",
 deliciousness_rating: 6,
 created_at: nil,
 updated_at: nil,
 serving: nil>



 [2] pry(main)> a = Comment.new
=> #<Comment:0x007fe843b2de68 id: nil, recipe_id: nil, body: nil, created_at: nil, updated_at: nil>
[3] pry(main)> a.recipe_id = 11
=> 11
[4] pry(main)> a.body = "so much deliciousness i can barely take it! lsdjflkjsdflksjdfl;ajsdflkjasdlkfjasdlkfjalsdjflkasjflkasjdflkajsdfljasdlfjalsdjflasjdflasjdflkajsflkadsjfl;kasdjfl;asjfdl;asjfdl"

=> "so much deliciousness i can barely take it! lsdjflkjsdflksjdfl;ajsdflkjasdlkfjasdlkfjalsdjflkasjflkasjdflkajsdfljasdlfjalsdjflasjdflasjdflkajsflkadsjfl;kasdjfl;asjfdl;asjfdl"
[5] pry(main)> a.save
D, [2016-09-29T23:52:25.758240 #22557] DEBUG -- :    (0.3ms)  BEGIN
D, [2016-09-29T23:52:25.771473 #22557] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[6] pry(main)> a.body = "yo this is great"
=> "yo this is great"
[7] pry(main)> a.save
D, [2016-09-29T23:52:34.831206 #22557] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:52:34.834315 #22557] DEBUG -- :   SQL (0.4ms)  INSERT INTO "comments" ("recipe_id", "body", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["recipe_id", 11], ["body", "yo this is great"], ["created_at", "2016-09-30 03:52:34.831502"], ["updated_at", "2016-09-30 03:52:34.831502"]]
D, [2016-09-29T23:52:34.836084 #22557] DEBUG -- :    (1.3ms)  COMMIT
=> true
[8] pry(main)> a.body = ""
=> ""
[9] pry(main)> a
=> #<Comment:0x007fe843b2de68 id: 13, recipe_id: 11, body: "", created_at: 2016-09-30 03:52:34 UTC, updated_at: 2016-09-30 03:52:34 UTC>
[10] pry(main)> a.save
D, [2016-09-29T23:53:03.399839 #22557] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:53:03.400942 #22557] DEBUG -- :    (0.2ms)  ROLLBACK
=> false
[11] pry(main)> a
=> #<Comment:0x007fe843b2de68 id: 13, recipe_id: 11, body: "", created_at: 2016-09-30 03:52:34 UTC, updated_at: 2016-09-30 03:52:34 UTC>
[12] pry(main)> Comment.last
D, [2016-09-29T23:53:17.967931 #22557] DEBUG -- :   Comment Load (0.5ms)  SELECT  "comments".* FROM "comments"  ORDER BY "comments"."id" DESC LIMIT 1
=> #<Comment:0x007fe843685708 id: 13, recipe_id: 11, body: "yo this is great", created_at: 2016-09-30 03:52:34 UTC, updated_at: 2016-09-30 03:52:34 UTC>
[13] pry(main)> a.recipe_id = nil
=> nil
[14] pry(main)> a.save
D, [2016-09-29T23:53:32.201512 #22557] DEBUG -- :    (0.2ms)  BEGIN
D, [2016-09-29T23:53:32.203039 #22557] DEBUG -- :    (0.2ms)  ROLLBACK
=> false

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end
 
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 
--citizen addon
shopModule:addBuyableItem({'Minotaur leather'}, 5878, 200)
shopModule:addBuyableItem({'Chicken feather'}, 5890, 200)
shopModule:addBuyableItem({'Honeycomb'}, 5902, 300)
shopModule:addBuyableItem({'Legion helmet'}, 2480, 10000)
 
--hunter addon
shopModule:addBuyableItem({'Sniper gloves'}, 5875, 25000)
shopModule:addBuyableItem({'Enchanted chicken wings'}, 5891, 35000)
shopModule:addBuyableItem({'Piece of royal steel'}, 5887, 15000)
shopModule:addBuyableItem({'Piece of draconian steel'}, 5889, 4000)
shopModule:addBuyableItem({'Piece of hell steal'}, 5888, 1000)
shopModule:addBuyableItem({'Red dragon leather'}, 5948, 1000)
shopModule:addBuyableItem({'Lizard leather'}, 5876, 600)
shopModule:addBuyableItem({'Elanes crossbow'}, 5947, 250000)
 
--mage addon
shopModule:addBuyableItem({'Soul stone'}, 5809, 4000000)
shopModule:addBuyableItem({'Ankh'}, 2193, 1000)
shopModule:addBuyableItem({'Ferumbras hat'}, 5903, 10000000)
shopModule:addBuyableItem({'Magic sulpher'}, 5904, 25000)
shopModule:addBuyableItem({'Red dragon scale'}, 5882, 1000)
shopModule:addBuyableItem({'lizard scale'}, 5881, 1000)
 
--knight addon
shopModule:addBuyableItem({'Huge chunk of crude iron'}, 5892, 17000)
shopModule:addBuyableItem({'Perfect behemoth fang'}, 5893, 2500)
shopModule:addBuyableItem({'Warrior sweat'}, 5885, 20000)
shopModule:addBuyableItem({'Iron ore'}, 5880, 1000)
shopModule:addBuyableItem({'damaged steel helmet'}, 11422, 50000)
 
--nobleman addon
--Only money
 
--summoner addon
shopModule:addBuyableItem({'Vampire dust'}, 5905, 3000)
shopModule:addBuyableItem({'Giant spider silk'}, 5879, 10000)
shopModule:addBuyableItem({'Holy orchid'}, 5922, 5000)
shopModule:addBuyableItem({'Ape fur'}, 5883, 500)
shopModule:addBuyableItem({'Red piece of cloth'}, 5911, 15000)
shopModule:addBuyableItem({'Bat wing'}, 5894, 1000)
 
--warrior addon
shopModule:addBuyableItem({'Dragon claw'}, 5919, 2000000)
shopModule:addBuyableItem({'Turtle shell'}, 5899, 2000)
shopModule:addBuyableItem({'Fighting spirit'}, 5884, 60000)
shopModule:addBuyableItem({'Hardened bones'}, 5925, 2000)
 
--barbarian addon
shopModule:addBuyableItem({'Green piece of cloth'}, 5910, 5000)
shopModule:addBuyableItem({'Spool of yarn'}, 5886, 90000)
 
--druid addon
shopModule:addBuyableItem({'Bear Paw'}, 5896, 1500)
shopModule:addBuyableItem({'Wolf Paw'}, 5897, 1500)
shopModule:addBuyableItem({'waterhose'}, 5939, 15000)
shopModule:addBuyableItem({'ceiron wolf tooth chain.'}, 5940, 25000)
shopModule:addBuyableItem({'Demon Dust'}, 5906, 15000) 
 
--wizard addon
shopModule:addBuyableItem({'Holy Orchid'}, 5922, 5000) 
 
--oriental addon
shopModule:addBuyableItem({'Mermaid Comb'}, 5945, 50000) 
shopModule:addBuyableItem({'Fish Fin'}, 5895, 8000) 
shopModule:addBuyableItem({'Blue Piece of Cloth'}, 5912, 5000) 
 
--pirate addon
shopModule:addBuyableItem({'Eye Patch'}, 6098, 2500) 
shopModule:addBuyableItem({'Hook'}, 6097, 2500) 
shopModule:addBuyableItem({'Peg leg'}, 6126, 2500) 
shopModule:addBuyableItem({'Ron the Ripper sabre'}, 11426, 500000) 
shopModule:addBuyableItem({'Lethal Lissy Shirt'}, 11425, 500000) 
shopModule:addBuyableItem({'Brutus Bloodbeard hat'}, 11424, 500000) 
shopModule:addBuyableItem({'Deadeye Devious Eye Patch'}, 6102, 500000) 
 
--assassin addon
shopModule:addBuyableItem({'White Piece of Cloth'}, 5909, 6000)
shopModule:addBuyableItem({'Red Piece of Cloth'}, 5911, 15000)
shopModule:addBuyableItem({'Brown Piece of Cloth'}, 5913, 6000)
shopModule:addBuyableItem({'Yellow Piece of Cloth'}, 5914, 8000)
shopModule:addBuyableItem({'Green Piece of Cloth'}, 5910, 5000)
shopModule:addBuyableItem({'Behemoth Claw'}, 5930, 10000)
shopModule:addBuyableItem({'Nose Ring'}, 5804, 2500000)
 
--beggar addon
shopModule:addBuyableItem({'Heaven Blossom'}, 5921, 2500) 
shopModule:addBuyableItem({'Simon the beggar favorite staff'}, 6107, 125000) 
 
--shaman addon
shopModule:addBuyableItem({'Mandrake'}, 5015, 2000000) 
shopModule:addBuyableItem({'Tribal Mask'}, 3967, 14000) 
shopModule:addBuyableItem({'Banana Staff'}, 3966, 14000) 
shopModule:addBuyableItem({'Voodoo Doll'}, 2322, 5000) 
shopModule:addBuyableItem({'Pirate Voodoo Doll'}, 5810, 5000) 
 
--norseman addon
shopModule:addBuyableItem({'Shard'}, 7290, 10000) 
 
--nightmare addon
shopModule:addBuyableItem({'Demonic Essence'}, 6500, 1000) 
 
--jester addon
--Already Sold
 
--brotherhood addon
--Already Sold
 
--demonhunter addon
shopModule:addBuyableItem({'Demon Horn'}, 5954, 10000) 
shopModule:addBuyableItem({'Talon'}, 2151, 9600) 
 
--yalaharian addon
shopModule:addBuyableItem({'Vampiric Crest'}, 9955, 10000000) 
 
--warmaster addon
--Crystal
 
--wayfarer addon
--Quest
 
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
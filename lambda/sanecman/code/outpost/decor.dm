/obj/structure/stalker/
	icon = 'lambda/sanecman/icons/decor.dmi'
	density = 0
	anchored = 1
	layer = OBJ_LAYER

/obj/structure/stalker/Initialize(mapload)
	. = ..()
	resistance_flags += INDESTRUCTIBLE

/obj/structure/sign/vendor
	name = "vendor sign"
	desc = "There is a vendor this way!"
	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "sign_vendor"
	density = 0

/obj/structure/sign/skadovsk_bar
	name = "bar sign"
	desc = "There is a bar this way!"
	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "sign_bar"
	density = 0

/obj/structure/stalker/polka
	name = "стеллаж"
	desc = "Деревянный стеллаж."
	icon = 'lambda/sanecman/icons/polka.dmi'
	icon_state = "polka"
	density = 1
	anchored = 1

/obj/structure/stalker/radiation
	name = "знак"
	desc = "Этот знак здесь явно не для красоты."

	icon_state = "radiation_sign"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/radiation/stop
	name = "знак"
	desc = "На табличке написано - \"Стоп! Запретная зона! Проход запрещен!\"."

	icon_state = "stop_sign"

/obj/structure/stalker/water
	anchored = 1
	var/busy = 0

/obj/structure/stalker/water/luzha
	name = "лужа"
	desc = "Обыкновенная лужа. Вода, вроде бы, не самая чистая, но умыться или смыть остатки грязи с одежды в ней можно."

	icon_state = "luzha"

/obj/structure/stalker/water/luzha/kap
	name = "лужа"
	desc = "Обыкновенная лужа. Вода, вроде бы, не самая чистая, но умыться или смыть остатки грязи с одежды в ней можно."

	icon_state = "luzha_kap"

/obj/structure/stalker/truba
	name = "труба"
	desc = "Старая ржавая труба."

	icon_state = "truba"
	density = 0

/obj/structure/stalker/truba/vert
	icon_state = "truba_v"

/obj/structure/stalker/body
	name = "труп"
	desc = "Полусгниший труп."

	icon_state = "deadbody1"
	density = 0

/obj/structure/stalker/body/Initialize(mapload)
	. = ..()
	icon_state = "deadbody[rand(1,6)]"

/obj/structure/stalker/bochka
	name = "бочка"
	desc = "Железная непримечательная бочка."

	icon_state = "bochka"
	density = 1

/obj/structure/stalker/bochka/red
	name = "красная бочка"
	icon_state = "red_bochka"

/obj/structure/stalker/water/bochka
	name = "бочка"
	desc = "Железная бочка, наполненная дождевой водой. Здесь можно умыться или смыть остатки грязи."

	icon_state = "bochka_s_vodoy"
	density = 1

/obj/structure/stalker/water/bochka/kap
	name = "бочка"
	desc = "Железная бочка, наполненная дождевой водой. Здесь можно умыться или смыть остатки грязи."

	icon_state = "diryavaya_bochka_s_vodoy"


/obj/structure/stalker/rozetka
	name = "розетка"
	desc = "Старая советская розетка."

	icon_state = "rozetka"
	density = 0

/obj/structure/stalker/krest
	name = "крест"
	desc = "Деревянный крест. Кажется, здесь кто-то закопан."

	icon_state = "krest"
	density = 0

/obj/structure/stalker/krest/bereza
	icon_state = "krest_bereza"

/obj/structure/stalker/komod
	name = "комод"
	desc = "Обыкновенный деревянный комод."

	icon_state = "komod"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/shina
	name = "шина"
	desc = "Тяжелая старая пробитая шина."

	icon_state = "shina"
	density = 1

/obj/structure/stalker/shina2
	name = "пара шин"
	desc = "Тяжелые старые пробитые шины."

	icon_state = "shina2"
	density = 1

/obj/structure/stalker/shina3
	name = "куча шин"
	desc = "Тяжелые старые пробитые шины."

	icon_state = "shina3a"
	density = 1

/obj/structure/stalker/switcher
	name = "переключатель"
	desc = "Неисправный выключатель."

	icon_state = "vikluchatel"

/obj/structure/stalker/doski
	name = "доски"
	desc = "Сломанные доски. Использовать где-либо их уже не получится."

	icon_state = "doski_oblomki"
	layer = 2.9
	pass_flags = LETPASSTHROW

/obj/structure/stalker/doski/doski2
	icon_state = "doski_oblomki2"

/obj/structure/stalker/doski/doski3
	icon_state = "doski_oblomki3"

/obj/structure/stalker/doski/doski4
	icon_state = "doski_oblomki4"

/obj/structure/stalker/battery
	name = "батарея"
	desc = "Ржавая отопительная батарея. Когда-то согревала дома, сейчас - просто очередная железка."

	icon_state = "gazovaya_truba"
	density = 0

/obj/structure/stalker/vanna
	name = "ванна"
	desc = "Старая чугунная ванна. Ничего особенного."
	icon_state = "vanna"
	density = 1

/obj/structure/stalker/list
	name = "ржавый лист"
	desc = "Тяжёлый жестянной покорёженный лист. Использовать его уже никак не получится."

	icon_state = "list_zhesti"
	density = 0

/obj/structure/stalker/yashik
	name = "ящик"
	icon_state = "yashik"
	desc = "Старый ящик."

	density = 1

/obj/structure/stalker/yashik/yaskik_a
	name = "ящик"
	icon_state = "yashik_a"
	desc = "Старый ящик."

	density = 1

/obj/structure/stalker/yashik/yaskik_a/big
	icon = 'lambda/sanecman/icons/decorations_32x64.dmi'
	icon_state = "crate"
	desc = "Большой старый ящик."

	opacity = 1
	density = 1
	layer = MASSIVE_OBJ_LAYER

/obj/structure/stalker/propane
	name = "баллон"
	desc = "Баллон с пропаном. Нет никаких надежд на газ внутри."

	icon = 'lambda/sanecman/icons/decorations_32x64.dmi'
	icon_state = "propane"
	density = 1

/obj/structure/stalker/stolb
	name = "столб"
	icon = 'lambda/sanecman/icons/decorations_32x64.dmi'
	icon_state = "stolb"
	desc = "Столб с висящими остатками проводов."

	layer = MASSIVE_OBJ_LAYER
	density = 0

/obj/structure/stalker/propane/dual
	icon_state = "propane_dual"

/obj/structure/stalker/pen
	name = "пень"
	desc = "Обычный пень. Ни больше, ни меньше."

	icon_state = "pen"
	density = 0

/obj/structure/stalker/radio
	name = "радио"
	desc = "Старое сломанное советское радио."

	icon_state = "radio"
	density = 1

/obj/structure/stalker/apc
	name = "энергощиток"
	desc = "Старый электрощиток."

	icon_state = "apc"
	density = 0

/obj/structure/stalker/apc/open
	icon_state = "apc1"

/obj/structure/stalker/apc/open2
	icon_state = "apc2"

/obj/structure/stalker/cover
	name = "ковёр"
	icon = 'lambda/sanecman/icons/cover.dmi'
	icon_state = "cover"
	desc = "Старый ковёр. Обычно висит на стене."

	density = 0

/obj/structure/stalker/porog
	name = "порог"
	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "porog1"
	desc = "Старый порог, о который можно легко зацепиться ногой."

	layer = BELOW_OBJ_LAYER
	density = 0

/obj/structure/stalker/porog/porog2
	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "porog2"

/obj/structure/stalker/televizor
	name =  "телевизор"
	desc = "Старый советский телевизор."

	icon_state = "TV"
	density = 1

/obj/structure/stalker/clocks
	name =  "часы"
	desc = "Остановились."

	icon = 'lambda/sanecman/icons/prishtina/decorations_32x32.dmi'
	icon_state = "clocks"
	density = 0

/obj/structure/stalker/painting
	icon = 'lambda/sanecman/icons/prishtina/decorations_32x32.dmi'
	density = 0

/obj/structure/stalker/painting/gorbachev
	name = "картина"
	desc = "Портрет последнего секретаря ЦК КПСС."

	icon_state = "gorbachev"

/obj/structure/stalker/painting/stalin
	name = "картина"
	desc = "Портрет второго секретаря ЦК КПСС."

	icon_state = "stalin"

/obj/structure/stalker/painting/lenin
	name = "картина"
	desc = "Портрет первого секретаря ЦК КПСС."

	icon_state = "lenin"

/obj/structure/stalker/intercom
	name = "домофон"
	desc = "Домофон."

	icon = 'lambda/sanecman/icons/backwater.dmi'
	icon_state = "intercom"
	density = 0

/obj/structure/stalker/televizor/broken
	icon_state = "TV_b"
	name =  "телевизор"
	desc = "Старый разбитый советский телевизор."
	density = 1

/obj/structure/stalker/bigyashik
	name = "ящик"
	icon = 'lambda/sanecman/icons/yashiki/decorations_64x64.dmi'
	icon_state = "bigyashik 0.0"
	density = 1
	opacity = 1

/obj/structure/stalker/bigyashik/melkiy
	icon = 'lambda/sanecman/icons/yashiki/decorations_32x64.dmi'
	icon_state = "bigyashik"

/obj/structure/stalker/oscillograph
	name = "оцилограф"
	desc = ""
	icon_state = "oscillograph_off"
	density = 1

/obj/structure/stalker/panel
	name = "техника"
	desc = ""
	icon_state = "panel_1"
	density = 1

/obj/structure/stalker/panel/panel2
	icon_state = "panel_2"

/obj/structure/stalker/musor_yashik
	name = "мусорка"
	desc = "Мусорный ящик"

	density = 1

/obj/structure/stalker/musor_yashik/red
	icon_state = "yashik_musor"

/obj/structure/stalker/musor_yashik/red/full
	icon_state = "yashik_musor_full"

/obj/structure/stalker/musor_yashik/green
	icon_state = "yashik_musor2"

/obj/structure/stalker/musor_yashik/green/full
	icon_state = "yashik_musor2_full"

/obj/structure/stalker/shitok
	name = "электрический щиток"
	desc = "Старый электрический щиток."

	icon_state = "shitok"
	density = 0

/obj/structure/stalker/shitok/shitok2
	name = "электрический щиток"
	desc = "Старый электрический щиток."

	icon_state = "shitok2"
	density = 0

/obj/structure/stalker/broke_table
	name = "стол"
	desc = "Перевёрнутый стол."

	icon_state = "broke_table1"
	density = 1

/obj/structure/stalker/broke_table/right
	icon_state = "broke_table2"

/obj/structure/stalker/lift
	name = "лифт"
	desc = "Старый ооветский лифт. Вероятнее всего он уже никогда не заработает."

	icon_state = "lift"

/obj/structure/stalker/luk
	name = "люк"
	desc = "Закрытый канализационный люк"
	icon = 'lambda/sanecman/icons/decor2.dmi'
	icon_state = "luk0"

/obj/structure/stalker/luk/open
	desc = "Открытый канализационый люк. Интересно, что внутри?"
	icon_state = "luk1"

/obj/structure/stalker/luk/open/ladder
	desc = "Открытый канализационны люк с лестницей. Интересно, что внутри?"
	icon_state = "luk2"

/obj/structure/stalker/trubas
	name = "pipe"
	desc = "Большая ржавая труба, служившая для газоснабжения."

	icon = 'lambda/sanecman/icons/structure/trubas.dmi'
	icon_state = "trubas"
	density = 1

/obj/structure/stalker/sign/bar100rentgen
	name = "вывеска"
	desc = "Бар 100 рентген."

	icon_state = "100_rentgen"

/obj/structure/stalker/bar_plitka
	name = "плитка"
	icon = 'lambda/sanecman/icons/floor.dmi'
	icon_state = "bar_plate1"
	layer = DISPOSAL_PIPE_LAYER

/obj/structure/stalker/bar_plitka/Initialize(mapload)
	. = ..()
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)

/obj/structure/stalker/plita
	name = "газовая плита"
	desc = "Ржавая и очень старая газовая плита. Где-то еще можно различить слой засохшего жира вперемешку с грязью и пылью."

	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "gazovaya_plita"
	density = 1
	anchored= 1

/obj/structure/stalker/pech
	name = "печь"
	desc = "Старая печь."

	icon = 'lambda/sanecman/icons/decor.dmi'
	icon_state = "pech"
	density = 0
	anchored = 1

/obj/structure/stalker/shkaf64
	name = "шкаф"
	desc = "Большой деревянный шкаф. Красивый, но в некоторых местах стерся и облез, на стекле пошли трещины. Несмотря на это, кажется, будто всего пару минут назад внутри стоял хрустальный бабушкин сервиз."

	icon = 'lambda/sanecman/icons/decorations_32x64.dmi'
	icon_state = "shkaf64"
	density = 1
	anchored = 1

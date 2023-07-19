/datum/mood_event/handcuffed
	mood_change = -1
	description = "<span class='warning'>Кажется мои выходки кто-то заметил.</span>\n"

/datum/mood_event/broken_vow //Used for when mimes break their vow of silence
	mood_change = -8
	description = "<span class='boldwarning'>Моё имя было опозорено нарушением моего обета...</span>\n"

/datum/mood_event/on_fire
	mood_change = -12
	description = "<span class='boldwarning'>ГОРЮ!!!</span>\n"

/datum/mood_event/suffocation
	mood_change = -12
	description = "<span class='boldwarning'>НЕ.. МОГУ... ДЫШАТЬ...</span>\n"

/datum/mood_event/burnt_thumb
	mood_change = -1
	description = "<span class='warning'>Не стоило мне играть с зажигалкой.</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/cold
	mood_change = -5
	description = "<span class='warning'>Тут очень холодно.</span>\n"

/datum/mood_event/hot
	mood_change = -5
	description = "<span class='warning'>Становится жарковато.</span>\n"

/datum/mood_event/creampie
	mood_change = -2
	description = "<span class='warning'>Меня окремили. На вкус как пирог.</span>\n"
	timeout = 3 MINUTES

/datum/mood_event/slipped
	mood_change = -2
	description = "<span class='warning'>Опять поскальзываюсь. Надо быть аккуратней.</span>\n"
	timeout = 1 MINUTES

/datum/mood_event/eye_stab
	mood_change = -4
	description = "<span class='boldwarning'>МНЕ ПРОТКНУЛИ ГЛАЗ!!!</span>\n"
	timeout = 3 MINUTES

/datum/mood_event/delam //SM delamination
	mood_change = -2
	description = "<span class='boldwarning'>Эти инженеры никогда не могут что-то сделать нормально...</span>\n"
	timeout = 10 MINUTES

/datum/mood_event/depression_minimal
	description = "<span class='warning'>Мне немного грустно.</span>\n"
	mood_change = -10
	timeout = 2 MINUTES

/datum/mood_event/depression_mild
	description = "<span class='warning'>Мне грустно без каких-либо причин.</span>\n"
	mood_change = -12
	timeout = 2 MINUTES

/datum/mood_event/depression_moderate
	description = "<span class='warning'>Мне грустно.</span>\n"
	mood_change = -14
	timeout = 2 MINUTES

/datum/mood_event/depression_severe
	description = "<span class='warning'>Хочу умереть.</span>\n"
	mood_change = -16
	timeout = 2 MINUTES

/datum/mood_event/shameful_suicide //suicide_acts that return SHAME, like sord
	mood_change = -15
	description = "<span class='boldwarning'>Даже не могу покончить со всем этим!</span>\n"
	timeout = 1 MINUTES

/datum/mood_event/dismembered
	timeout = 8 MINUTES
	description = "<span class='boldwarning'>АА-А! МНЕ НУЖНА БЫЛА ЭТА КОНЕЧНОСТЬ!</span>\n"
	mood_change = -15

/datum/mood_event/tased
	description = "<span class='warning'>There's no \"z\" in \"taser\". It's in the zap.</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/embedded
	mood_change = -7
	description = "<span class='boldwarning'>Достаньте это из меня, достаньте!</span>\n"

/datum/mood_event/table
	mood_change = -2
	description = "<span class='warning'>Кто-то бросил меня на стол!</span>\n"
	timeout = 1 MINUTES

/datum/mood_event/table_headsmash
	description = "<span class='warning'>My fucking head, that hurts...</span>"
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/brain_damage
	mood_change = -3

/datum/mood_event/brain_damage/add_effects()
	var/damage_message = pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage")
	description = "<span class='warning'>Хых... Хах... [damage_message]</span>\n"

/datum/mood_event/hulk //Entire duration of having the hulk mutation
	description = "<span class='warning'>ХАЛК КРУШИТЬ</span>\n"
	mood_change = 8 //lol

/datum/mood_event/epilepsy //Only when the mutation causes a seizure
	mood_change = -3
	description = "<span class='warning'>Стоило обратить внимание на предупреждение об эпилепсии.</span>\n"
	timeout = 5 MINUTES

/datum/mood_event/nyctophobia
	description = "<span class='warning'>Здесь темновато...</span>\n"

/datum/mood_event/family_heirloom_missing
	mood_change = -4
	description = "<span class='warning'>Скучаю по моей семейной реликвии...</span>\n"

/datum/mood_event/healsbadman
	mood_change = -4
	description = "<span class='warning'>Меня держит тонкая нить, и у меня ощущение, что можно развалиться в любой момент!</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/jittery
	mood_change = -2
	description = "<span class='warning'>Нервничаю, нервничаю и не могу стоять ровно!</span>\n"

/datum/mood_event/vomit
	mood_change = -2
	description = "<span class='warning'>Меня только что вырвало. Мерзость.</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/vomitself
	mood_change = -4
	description = "<span class='warning'>Меня только что стошнило на себя. Это отвратительно.</span>\n"
	timeout = 3 MINUTES

/datum/mood_event/painful_medicine
	mood_change = -5
	description = "<span class='warning'>Медицина может быть и хороша для меня, но сейчас она адово жалит!</span>\n"
	timeout = 1 MINUTES

/datum/mood_event/spooked
	mood_change = -4
	description = "<span class='warning'>Дребезжание тех костей... Я не могу это забыть.</span>\n"
	timeout = 4 MINUTES

/datum/mood_event/loud_gong
	mood_change = -3
	description = "<span class='warning'>Этот гонг и правда очень громок!</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/notcreeping
	mood_change = -6
	description = "<span class='warning'>Голоса не рады тому, что я не выполняю своё задание, и они болезненно заставляют мои мысли выполнять его.</span>\n"
	timeout = 30
	hidden = TRUE

/datum/mood_event/notcreepingsevere//not hidden since it's so severe
	mood_change = -30
	description = "<span class='boldwarning'>ОНИИИ ХОТЯЯЯТ ЕГООО!!</span>\n"
	timeout = 30

/datum/mood_event/notcreepingsevere/add_effects(name)
	var/list/unstable = list(name)
	for(var/i in 1 to rand(3,5))
		unstable += copytext_char(name, -1)
	var/unhinged = uppertext(unstable.Join(""))//example Tinea Luxor > TINEA LUXORRRR (with randomness in how long that slur is)
	description = "<span class='boldwarning'>ОНИИИ ХОТЯЯЯТ [unhinged]!!</span>\n"

/datum/mood_event/sapped
	mood_change = -15
	description = "<span class='boldwarning'>Необъяснимая печаль пожирает меня...</span>\n"
	timeout = 1.5 MINUTES

/datum/mood_event/back_pain
	mood_change = -15
	description = "<span class='boldwarning'>Сумки никогда не сидят ровно на моей спине, это очень больно!</span>\n"

/datum/mood_event/sad_empath
	mood_change = -2
	description = "<span class='warning'>Кто-то видимо грустит...</span>\n"
	timeout = 1 MINUTES

/datum/mood_event/sad_empath/add_effects(mob/sadtarget)
	description = "<span class='warning'>[sadtarget.name] кажется грустит...</span>\n"

/datum/mood_event/sacrifice_bad
	mood_change = -5
	description ="<span class='warning'>Эти чёртовы дикари!</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/artbad
	mood_change = -2
	description = "<span class='warning'>У меня получалось и лучше чем это.</span>\n"
	timeout = 2 MINUTES

/datum/mood_event/graverobbing
	description ="<span class='boldwarning'>I just desecrated someone's grave... I can't believe I did that...</span>\n"
	mood_change = -8
	timeout = 3 MINUTES

/datum/mood_event/deaths_door
	description = "<span class='boldwarning'>This is it... I'm really going to die.</span>\n"
	mood_change = -20

/datum/mood_event/gunpoint
	description = "<span class='boldwarning'>This guy is insane! I better be careful....</span>\n"
	mood_change = -10

/datum/mood_event/tripped
	description = "<span class='boldwarning'>I can't believe I fell for the oldest trick in the book!</span>\n"
	mood_change = -5
	timeout = 2 MINUTES

/datum/mood_event/untied
	description = "<span class='boldwarning'>I hate when my shoes come untied!</span>\n"
	mood_change = -3
	timeout = 1 MINUTES

/datum/mood_event/high_five_alone
	description = "<span class='boldwarning'>I tried getting a high-five with no one around, how embarassing!</span>\n"
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/high_five_full_hand
	description = "<span class='boldwarning'>Oh God, I don't even know how to high-five correctly...</span>\n"
	mood_change = -1
	timeout = 45 SECONDS

/datum/mood_event/left_hanging
	description = "<span class='boldwarning'>But everyone loves high fives! Maybe people just... hate me?</span>\n"
	mood_change = -2
	timeout = 1.5 MINUTES

/datum/mood_event/too_slow
	description = "<span class='boldwarning'>NO! HOW COULD I BE.... TOO SLOW???</span>\n"
	mood_change = -2 // multiplied by how many people saw it happen, up to 8, so potentially massive. the ULTIMATE prank carries a lot of weight
	timeout = 2 MINUTES

/datum/mood_event/too_slow/add_effects(param)
	var/people_laughing_at_you = 1 // start with 1 in case they're on the same tile or something
	for(var/mob/living/carbon/iter_carbon in oview(owner, 7))
		if(iter_carbon.stat == CONSCIOUS)
			people_laughing_at_you++
			if(people_laughing_at_you > 7)
				break

	mood_change *= people_laughing_at_you
	return ..()

//These are unused so far but I want to remember them to use them later
/datum/mood_event/surgery
	description = "<span class='boldwarning'>МЕНЯ РЕЖУТ НА КУСОЧКИ!!</span>\n"
	mood_change = -16

/datum/mood_event/nanite_sadness
	description = "<span class='warning robot'>+++++++HAPPINESS SUPPRESSION+++++++</span>\n"
	mood_change = -7

/datum/mood_event/nanite_sadness/add_effects(message)
	description = "<span class='warning robot'>+++++++[message]+++++++</span>\n"

/datum/mood_event/bald
	description ="<span class='warning'>I need something to cover my head...</span>\n"
	mood_change = -3

/datum/mood_event/bad_touch
	description = "<span class='warning'>I don't like when people touch me.</span>\n"
	mood_change = -3
	timeout = 4 MINUTES

/datum/mood_event/very_bad_touch
	description = "<span class='warning'>I really don't like when people touch me.</span>\n"
	mood_change = -5
	timeout = 4 MINUTES

/datum/mood_event/noogie
	description = "<span class='warning'>Ow! This is like space high school all over again...</span>\n"
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/noogie_harsh
	description = "<span class='warning'>OW!! That was even worse than a regular noogie!</span>\n"
	mood_change = -4
	timeout = 1 MINUTES

/datum/mood_event/irritate
	description = "It feels like I'm itching all over!"
	mood_change = -2

/datum/mood_event/cement
	description = "<span class='warning'>I was forced to eat cement...</span>\n"
	mood_change = -6
	timeout = 4 MINUTES

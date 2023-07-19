// Положительные награды
#define METACOIN_ESCAPE_REWARD           10 // за побег со станции
#define METACOIN_SURVIVE_REWARD          7  // за выживание в раунде
#define METACOIN_NOTSURVIVE_REWARD       5  // за смерть, если дождался конца раунда

// Награды за заказы в гражданском терминале заказов
#define METACOIN_BOUNTY_REWARD_HARD		 rand(10, 15)  	// за сложный выполненный заказ
#define METACOIN_BOUNTY_REWARD_NORMAL	 rand(5, 10)  	// за обычный выполненный заказ
#define METACOIN_BOUNTY_REWARD_EASY		 rand(1, 5)		// за лёгкий выполненный заказ

// Отрицательные награды
#define METACOIN_TEETH_REWARD      		-2 // потеря зубика
#define METACOIN_SUCC_REWARD      		-5 // сдался
#define METACOIN_PROB_SUICIDE_REWARD	-6 // вероятный суицид
#define METACOIN_BADWORDS_REWARD        -7 // сказал плохое слово
#define METACOIN_SUPERDEATH_REWARD      -10 // смерть от суперматерии
#define METACOIN_SUICIDE_REWARD      	-12 // суицид
#define METACOIN_CHASM_REWARD 			-15 // падение в пропасть
#define METACOIN_DNR_REWARD      		-20 // разорвал связь с телом
#define METACOIN_GHOSTIZE_REWARD      	-47 // покинул тело

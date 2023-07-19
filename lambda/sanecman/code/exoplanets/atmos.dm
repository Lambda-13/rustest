//Атмос на экзопланетах

/// Содержание: ///
/// * Дефаины ///
/// * Датумы ///

/// Дефаины ///
#define RANDOM_ATMOS "random_atmos"
#define RUINED_CITY_ATMOS "ruined_city_atmos"
#define ROBOTIC_GUARDIANS_ATMOS "robotic_guardians_atmos"
#define BARREN_ATMOS "barren_atmos"
#define CHLORINE_ATMOS "chlorine_atmos"
#define DESERT_ATMOS "desert_atmos"
#define GRASS_ATMOS "grass_atmos"
#define GRASS_TERRAFORMED_ATMOS "grass_terraformed_atmos"
#define SHROUDED_ATMOS "shrouded_atmos"
#define SNOW_ATMOS "snow_atmos"
#define VOLCANIC_ATMOS "volcanic_atmos"

/// Датумы ///
//Пустыня
//Чуть жарко, немного углерода, повышенное давление
/datum/atmosphere/desert
	id = DESERT_ATMOS

	base_gases = list(
		GAS_O2=5,
		GAS_N2=10,
	)
	normal_gases = list(
		GAS_O2=10,
		GAS_N2=10,
		GAS_CO2=0.1,
	)
	restricted_gases = list(GAS_CO2=0.1)
	restricted_chance = 50

	minimum_pressure = ONE_ATMOSPHERE
	maximum_pressure = ONE_ATMOSPHERE + 10

	minimum_temp = T20C + 20
	maximum_temp = T20C + 100

///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////

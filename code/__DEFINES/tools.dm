// Tool types
#define TOOL_CROWBAR "crowbar"
#define TOOL_MULTITOOL "multitool"
#define TOOL_SCREWDRIVER "screwdriver"
#define TOOL_WIRECUTTER "wirecutter"
#define TOOL_WRENCH "wrench"
#define TOOL_WELDER "welder"
#define TOOL_ANALYZER "analyzer"
#define TOOL_MINING "mining"
#define TOOL_SHOVEL "shovel"
#define TOOL_RETRACTOR "retractor"
#define TOOL_HEMOSTAT "hemostat"
#define TOOL_CAUTERY "cautery"
#define TOOL_DRILL "drill"
#define TOOL_SCALPEL "scalpel"
#define TOOL_SAW "saw"
#define TOOL_BILLOW "billow"
#define TOOL_TONG "tong"
#define TOOL_HAMMER "hammer"
#define TOOL_BLOWROD "blowrod"

// tool_act chain flags

// Дефайны что активируются когда кто-то делает что-то тулзами
// Их надо бы впилить во все штуки по типу wirecutter_act
// Но пока что обойдёмся без такой хуйни
// Если решите везде расставить эти дефайны
// Подумайте а надо ли вам это
/// When a tooltype_act proc is successful
#define TOOL_ACT_TOOLTYPE_SUCCESS (1<<0)
/// When [COMSIG_ATOM_TOOL_ACT] blocks the act
#define TOOL_ACT_SIGNAL_BLOCKING (1<<1)

/// When [TOOL_ACT_TOOLTYPE_SUCCESS] or [TOOL_ACT_SIGNAL_BLOCKING] are set
#define TOOL_ACT_MELEE_CHAIN_BLOCKING (TOOL_ACT_TOOLTYPE_SUCCESS | TOOL_ACT_SIGNAL_BLOCKING)

// If delay between the start and the end of tool operation is less than MIN_TOOL_SOUND_DELAY,
// tool sound is only played when op is started. If not, it's played twice.
#define MIN_TOOL_SOUND_DELAY 20

//redfoks
#define TOOL_MECHCOMP "mechcomp"

/// Defers call of proc AfterChange in ChangeTurf.
#define CHANGETURF_DEFER_CHANGE (1 << 0)
/// This flag prevents changeturf from gathering air from nearby turfs to fill the new turf with an approximation of local air
#define CHANGETURF_IGNORE_AIR (1 << 1)
/// Prevents ChangeTurf from returning without an operation if the given path and baseturfs are identical to the pre-existing ones and the preloader is not engaged.
#define CHANGETURF_FORCEOP (1 << 2)
/// A flag for PlaceOnTop to just instance the new turf instead of calling ChangeTurf. Used for uninitialized turfs NOTHING ELSE
#define CHANGETURF_SKIP (1 << 3)
/// Inherit air from previous turf. Implies CHANGETURF_IGNORE_AIR
#define CHANGETURF_INHERIT_AIR (1 << 4)
/// Defers smoothing and starlight recalculation in ChangeTurf so that they may later be more performantly done in bulk.
#define CHANGETURF_DEFER_BATCH (1 << 5)

#define IS_OPAQUE_TURF(turf) (turf.directional_opacity == ALL_CARDINALS)

//supposedly the fastest way to do this according to https://gist.github.com/Giacom/be635398926bb463b42a
#define RANGE_TURFS(RADIUS, CENTER) \
	RECT_TURFS(RADIUS, RADIUS, CENTER)

#define RECT_TURFS(H_RADIUS, V_RADIUS, CENTER) \
	block( \
	locate(max(CENTER.x-(H_RADIUS),1),          max(CENTER.y-(V_RADIUS),1),          CENTER.z), \
	locate(min(CENTER.x+(H_RADIUS),world.maxx), min(CENTER.y+(V_RADIUS),world.maxy), CENTER.z) \
	)

#define Z_TURFS(ZLEVEL) block(locate(1,1,ZLEVEL), locate(world.maxx, world.maxy, ZLEVEL))

///Returns all currently loaded turfs
#define ALL_TURFS(...) block(locate(1, 1, 1), locate(world.maxx, world.maxy, world.maxz))

#define TURF_FROM_COORDS_LIST(List) (locate(List[1], List[2], List[3]))

#define IS_OPAQUE_TURF(turf) (turf.directional_opacity == ALL_CARDINALS)

/// Turf will be passable if density is 0
#define TURF_PATHING_PASS_DENSITY 0
/// Turf will be passable depending on [CanAStarPass] return value
#define TURF_PATHING_PASS_PROC 1
/// Turf is never passable
#define TURF_PATHING_PASS_NO 2

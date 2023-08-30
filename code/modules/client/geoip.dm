/datum/geoip_data
	var/holder = null
	var/status = null
	var/country = null
	var/countryCode = null
	var/region = null
	var/regionName = null
	var/city = null
	var/timezone = null
	var/mobile = null
	var/proxy = null
	var/ip = null
	var/isp = null

/datum/geoip_data/New(client/C, addr)
	INVOKE_ASYNC(src, PROC_REF(get_geoip_data), C, addr)

/datum/geoip_data/proc/get_geoip_data(client/C, addr)

	if(!C || !addr)
		return

	if(C.holder)
		status = "admin"
		return

	if(!try_update_geoip(C, addr))
		return

	if(!C)
		return

	if(status == "updated")
		if(proxy == "true")
			proxy = "<span style='color: red'>true</span>"
			if (!CONFIG_GET(flag/proxy_autoban))
				log_admin_private("[C.ckey] зашёл впервые на сервер и он использует прокси или впн.")
				message_admins("<span class='adminnotice'>[C.ckey] зашёл впервые на сервер и он использует прокси или впн.</span>")
				for(var/client/X in GLOB.admins)
					if(X.prefs.toggles & SOUND_ADMINVPNPROXYPING)
						SEND_SOUND(X, sound('lambda/sanecman/sound/admin_alert.ogg'))
				return
			var/reason = "IP в бан листе."
			var/list/ban = list()
			var/ckey = C.ckey
			ban["admin"] = "VAC AntiCheat"
			ban["type"] = list("sticky")
			ban["reason"] = "(InGameBan)(AUTOBAN)" //this will be displayed in dd only
			ban["message"] = reason
			world.SetConfig("ban",ckey,list2stickyban(ban))
			ban = stickyban2list(list2stickyban(ban))
			ban["matches_this_round"] = list()
			ban["existing_user_matches_this_round"] = list()
			ban["admin_matches_this_round"] = list()
			ban["pending_matches_this_round"] = list()
			SSstickyban.cache[ckey] = ban
			C<<link("https://ss14.su/PERMABANNED.mp4")
			sleep(1)
			winset(C, null, "command=.quit")
			log_admin_private("VAC AntiCheat выдал пермабан [C.ckey] по причине использования прокси или впн.")
			message_admins("<span class='adminnotice'>VAC AntiCheat выдал пермабан [C.ckey] по причине использования прокси или впн.\nПермабан одноразовый, снять можно через панель стики банов.\nЕсли разбаните игрока то его больше не будет банить на сервере.</span>")
			for(var/client/X in GLOB.admins)
				if(X.prefs.toggles & SOUND_ADMINVPNPROXYPING)
					SEND_SOUND(X, sound('lambda/sanecman/sound/admin_alert.ogg'))
			return

/datum/geoip_data/proc/try_update_geoip(client/C, addr)
	if(!C || !addr)
		return FALSE

	if(addr == "127.0.0.1")
		addr = "[world.internet_address]"

	if(status != "updated")
		holder = C.ckey

		var/msg = geoip_check(addr)
		if(msg == "limit reached" || msg == "export fail")
			status = msg
			return FALSE

		for(var/data in msg)
			switch(data)
				if("country")
					country = msg[data]
				if("countryCode")
					countryCode = msg[data]
				if("region")
					region = msg[data]
				if("regionName")
					regionName = msg[data]
				if("city")
					city = msg[data]
				if("timezone")
					timezone = msg[data]
				if("isp")
					isp = msg[data]
				if("mobile")
					mobile = msg[data] ? "true" : "false"
				if("proxy")
					proxy = msg[data] ? "true" : "false"
				if("query")
					ip = msg[data]
		status = "updated"
	return TRUE

/proc/geoip_check(addr)
	var/list/vl = world.Export("http://ip-api.com/json/[addr]?fields=205599")
	if (!("CONTENT" in vl) || vl["STATUS"] != "200 OK")
		return "export fail"

	var/msg = file2text(vl["CONTENT"])
	return json_decode(msg)

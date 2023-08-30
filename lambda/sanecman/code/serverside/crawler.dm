/client/proc/ask_crawler_for_support()
	var/datum/http_request/request = new()
	request.prepare(RUSTG_HTTP_METHOD_GET, "http://nossl.crawler.station13.ru/api/?ckey=[ckey]", "", "", null)
	request.begin_async()
	UNTIL(request.is_complete() || !src)
	if (!src)
		return
	var/datum/http_response/response = request.into_response()

	if(response.errored || response.status_code != 200)
		return FALSE

	if (response.body)
		return json_decode(response.body)
	return FALSE

/client/proc/crawler_sanity_check()
	set waitfor = 0

	if(!ckey)
		return

	var/list/cril = ask_crawler_for_support()
	var/list/badlist = list("SS220", "Tau Ceti", "SS13.RU", "Fluffy", "Infinity", "White")

	if(!cril)
		return TRUE

	var/clear_sanity = TRUE

	for(var/i in 2 to cril.len)
		if(text_in_list(cril[i]["servername"], badlist))
			if(text2num(cril[i]["count"]) > 360)
				if(clear_sanity)
					message_admins("[ADMIN_LOOKUPFLW(src)] имеет грязь.")
				message_admins(" >>> [cril[i]["servername"]] ([cril[i]["count"]]m).")
				clear_sanity = FALSE

	return clear_sanity

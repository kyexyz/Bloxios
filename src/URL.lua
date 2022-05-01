local HttpService = game:GetService('HttpService')

local Types = require(script.Parent.Types)


local function isURLValid(url: Types.URL): boolean
	if not url.protocol or url.protocol == '' then
		return false
	end
	
	if not url.hostname or url.hostname == '' then
		return false
	end
	
	if url.port and not tonumber(url.port) then
		return false
	end
	
	return true
end

local function gethref(urlObject: Types.URL)
	local x = urlObject.protocol .. '://' .. urlObject.host
	if urlObject.path then
		x ..= urlObject.path
	end
	if urlObject.hash then
		x ..= '#' .. urlObject.hash
	end
	
	return x
end

local function getHost(urlObject: Types.URL)
	local x = if urlObject.port then urlObject.hostname .. ":" .. urlObject.port else urlObject.hostname

	return x 	
end

local function getPath(urlObject: Types.URL)
	local x = ''
	
	if urlObject.pathname then
		x = urlObject.pathname
	end
	if urlObject.search then
		x ..= '?' .. urlObject.search
	end
	
	return x 
end

local function getSearch(urlObject: Types.URL, searchParams)
	if not searchParams then
		searchParams = urlObject.searchParams
	end
	
	if searchParams then
		local x = ''
		
		for k,v in next, urlObject.searchParams do
			if x ~= '' then
				x ..= '&'
			end
			
			x ..= k .. '=' .. tostring(v)
		end
		
		--x = HttpService:UrlEncode(x)
		
		return x
	else
		return ''
	end
end

local function getSearchParams(urlObject: Types.URL)
	if urlObject.search == '' or not urlObject.search then
		return {}
	end
	
	local rawParams = string.split(urlObject.search, '&')
	local params = {}
	
	for k,v in next, rawParams do 
		local x = string.split(v, '=')
		params[x[1]] = tostring(x[2])
	end
	
	return params
end

local function parseUrl(relativeOrAbsolute: string, absoluteBase: string?, searchParams: {[string]: string}?)
	local urlObject: Types.URL = {
		isValid = true;
		protocol = '';
		hostname = '';
		host = '';
		pathname = '';
		search = '';
		searchParams = {};
		path = '';
		hash = '';
		href = '';
	}
	
	local rawUrl = if absoluteBase then absoluteBase .. relativeOrAbsolute else relativeOrAbsolute

	-- protocol
	do
		if string.sub(rawUrl, 1, 7) == 'http://' then
			urlObject.protocol = 'http'
			rawUrl = string.sub(rawUrl, 8)
		elseif string.sub(rawUrl, 1, 8) == 'https://' then
			urlObject.protocol = 'https'
			rawUrl = string.sub(rawUrl, 9)
		elseif not string.find(rawUrl, '://') then
			urlObject.protocol = 'https'
		end
	end

	-- hostname
	do
		local x = ''
		for i = 1, #rawUrl, 1 do
			local s = string.sub(rawUrl, i, i)
			if s == '/' or s == ':' or s == '#' then
				break
			end
			x ..= "" .. s
		end
		urlObject.hostname = x
		rawUrl = string.sub(rawUrl, #x + 1)		
	end

	-- port
	do
		if string.sub(rawUrl, 1, 1) == ':' then
			local x = string.match(rawUrl, ':%d+')
			rawUrl = string.sub(rawUrl, #x + 1)
			x = string.sub(x, 2)
			urlObject.port = x
		end
	end

	-- host
	do
		urlObject.host = getHost(urlObject)
	end

	-- pathname
	do
		local x = ''
		for i = 1, #rawUrl, 1 do
			local s = string.sub(rawUrl, i, i)
			if s == '?' or s == '#' then
				break
			end
			x ..= s
		end
		if #x < 1 then
			urlObject.pathname = '/'
		else
			urlObject.pathname = x
		end
		rawUrl = string.sub(rawUrl, #x + 1)		
	end

	-- search
	do
		if string.sub(rawUrl, 1, 1) == '?' then
			rawUrl = string.sub(rawUrl, 2)
			local x = ''
			for i = 1, #rawUrl, 1 do
				local s = string.sub(rawUrl, i, i)
				if s == '#' then
					break
				end
				x ..= "" .. s
			end
			urlObject.search = x
			rawUrl = string.sub(rawUrl, #x + 1)	
		end
	end

	-- search params
	do
		urlObject.searchParams = getSearchParams(urlObject)

		if searchParams then
			for k,v in next, searchParams do
				urlObject.searchParams[k] = v
			end
		end

		urlObject.search = getSearch(urlObject)
	end

	-- path
	do
		urlObject.path = getPath(urlObject)
	end

	-- hash
	do
		if string.sub(rawUrl, 1, 1) == '#' then
			rawUrl = string.sub(rawUrl, 2)
			urlObject.hash = string.sub(rawUrl, 1)
		end
	end

	-- href
	do
		urlObject.href = gethref(urlObject)
	end
	
	if isURLValid(urlObject) == false then
		error('Failed to construct URL: Invalid URL')
	end
	
	return urlObject
end

local function urlUpdated(url: Types.URL, key, value)
	if not url[key] then
		return 
	end
	
	url[key] = value
	
	if key == 'hostname' or key == 'port' then
		url.host = getHost(url)
	end
	
	if key == 'search' then
		url.searchParams = getSearchParams(url)
	end	
	
	if key == 'searchParams' then
		url.search = getSearch(url)
	end
	
	if key == 'pathname' or key == 'search' or key == 'searchParams' then
		url.path = getPath(url)
	end

	url.href = gethref(url)
	
	url = parseUrl(gethref(url))
	
	if isURLValid(url) == false then
		error('Failed to construct URL: Invalid URL')
	end
end


return function(relativeOrAbsolute: string, absoluteBase: string?, searchParams: {[string]: string}?)
	local urlObject = parseUrl(relativeOrAbsolute, absoluteBase, searchParams)
	
	local self = setmetatable(urlObject, {
		--__index = urlObject,
		__tostring = function(tbl)
			return tbl.href
		end,

	})
	
	function self:toJSON()
		return HttpService:JSONEncode(self)
	end
	
	function self:Update(key, value)
		urlUpdated(urlObject :: Types.URL, key, value)
		local isValid = isURLValid(urlObject :: Types.URL) 
		if isValid == false then
			error('Failed to construct URL: Invalid URL')
		end	
	end
	
	function self:Destroy()
		table.clear(self)
		setmetatable(self, nil)
		self = nil
	end
	
	return self
end
local HttpService = game:GetService("HttpService")

local BloxiosInstance = {}
BloxiosInstance.__index = BloxiosInstance
BloxiosInstance.__call = function(tbl, ...)
	local config = table.pack(...)[1]
	return createRequest(tbl, config)
end

local Promise = require(script.Parent.Parent.Promise)
local TableUtil = require(script.Parent.Parent.TableUtil)
local Types = require(script.Parent.Types)
local DefaultRequestConfig = require(script.Parent.DefaultRequestConfig)
local URL = require(script.Parent.URL)

function createResponse(httpRes, config)
	local data
	pcall(function()
		data = HttpService:JSONDecode(httpRes.Body)
	end)

	local response = {
		data = data or httpRes.Body,
		status = httpRes.StatusCode,
		statusText = httpRes.StatusMessage,
		headers = httpRes.Headers,
		config = config,
	}

	return response
end

function createRequest(instance, config: Types.RequestConfig)
	config.instance = instance

	for k, v in next, DefaultRequestConfig do
		if config[k] == nil then
			if typeof(v) == "table" then
				config[k] = TableUtil.Copy(v, true)
			else
				config[k] = v
			end
		end

		if typeof(config[k]) == "table" and typeof(v) == "table" then
			for a, b in next, v do
				if config[k][a] == nil then
					config[k][a] = b
				end
			end
		end
	end

	for k, v in next, instance.defaults do
		if config[k] == nil then
			if typeof(v) == "table" then
				config[k] = TableUtil.Copy(v, true)
			else
				config[k] = v
			end
		end

		if typeof(config[k]) == "table" and typeof(v) == "table" then
			for a, b in next, v do
				if config[k][a] == nil then
					config[k][a] = b
				end
			end
		end
	end

	-- create url object
	local url = URL(config.url, if config.baseURL then config.baseURL else nil, config.params)

	-- roblox proxy
	do
		if string.find(url.hostname, "roblox.com") then
			local newHost = url.hostname
			newHost = string.gsub(newHost, "roblox.com", "roproxy.com")

			url:Update("hostname", newHost)
		end
	end

	config.baseURL = url.host
	config.url = url.path .. "#" .. url.hash
	config.urlObject = url

	-- cookies
	do
		if config.cookies then
			local cookiesStr = ""
			for k, v in next, config.cookies do
				if cookiesStr ~= "" then
					cookiesStr ..= "; "
				end
				cookiesStr ..= k .. "=" .. v
			end

			config.headers["cookie"] = cookiesStr
		end
	end

	return Promise.new(function(resolve, reject)
		local ok, result = pcall(HttpService.RequestAsync, HttpService, {
			Url = url.href,
			Method = config.method,
			Headers = config.headers,
			Body = if config.method ~= "GET" and config.method ~= "HEAD"
				then HttpService:JSONEncode(config.data)
				else nil,
		})

		if ok then
			local response = createResponse(result, config)

			resolve(response)
		else
			reject(result, config)
		end
	end)
end

--[=[
	A Bloxios instance is a wrapper around the HttpService, an easy-to-use Http client.

	@class BloxiosInstance
]=]
function BloxiosInstance.new(config: Types.RequestConfig)
	local self = setmetatable({
		defaults = config,
	}, BloxiosInstance)

	return self
end

--[=[
	Creates a Http request with Bloxios

	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:request(config: Types.RequestConfig)
	return createRequest(self, config)
end

--[=[
	Creates a Http GET request with Bloxios

	@tag alias
	@param url string
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:get(url: string?, config)
	if not config then
		config = {}
	end

	config.method = "GET"

	if url then
		config.url = url
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http DELETE request with Bloxios

	@tag alias
	@param url string
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:delete(url: string?, config)
	if not config then
		config = {}
	end

	config.method = "DELETE"

	if url then
		config.url = url
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http HEAD request with Bloxios

	@tag alias
	@param url string
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:head(url: string?, config)
	if not config then
		config = {}
	end

	config.method = "HEAD"

	if url then
		config.url = url
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http OPTIONS request with Bloxios

	@tag alias
	@param url string
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:options(url: string?, config)
	if not config then
		config = {}
	end

	config.method = "OPTIONS"

	if url then
		config.url = url
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http POST request with Bloxios

	@tag alias
	@param url string
	@param data {[string]: any}
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:post(url: string?, data: { [string]: any }?, config)
	if not config then
		config = {}
	end

	config.method = "POST"

	if url then
		config.url = url
	end

	if data then
		config.data = data
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http PUT request with Bloxios

	@tag alias
	@param url string
	@param data {[string]: any}
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:put(url: string?, data: { [string]: any }?, config)
	if not config then
		config = {}
	end

	config.method = "PUT"

	if url then
		config.url = url
	end

	if data then
		config.data = data
	end

	return createRequest(self, config)
end

--[=[
	Creates a Http PATCH request with Bloxios

	@tag alias
	@param url string
	@param data {[string]: any}
	@param config RequestConfig
	@return Promise<BloxiosResponse>
]=]
function BloxiosInstance:patch(url: string?, data: { [string]: any }?, config)
	if not config then
		config = {}
	end

	config.method = "PATCH"

	if url then
		config.url = url
	end

	if data then
		config.data = data
	end

	return createRequest(self, config)
end

--[=[
	Destroys the Bloxios Instance
]=]
function BloxiosInstance:Destroy()
	table.clear(self)
	setmetatable(self, nil)
	self = nil
end

return BloxiosInstance

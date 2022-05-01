local Types = require(script.Parent.Types)

local defaultRequestConfig: Types.RequestConfig = {
	method = 'GET',
	headers = {},
	params = {},
	data = {},
}

return defaultRequestConfig
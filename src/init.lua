local Types = require(script.Types)
local BloxiosInstance = require(script.BloxiosInstance)

--[=[
	Default Bloxios Instance
	Extends BloxiosInstance
	
	@class Bloxios
]=]
local Bloxios = BloxiosInstance.new({})

--[=[
	Creates a new Bloxios instance with the specified configuration

	@param config RequestConfig
	@return BloxiosInstance
]=]
function Bloxios.create(config: Types.RequestConfig)
	return BloxiosInstance.new(config)	
end


return Bloxios
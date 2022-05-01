--[=[
	An object describing the URL
	@interface URL
	@within BloxiosInstance
	.isValid boolean
	.href string
	.protocol string
	.port string
	.hostname string
	.host string
	.pathname string
	.search string
	.searchParams {[string]: string}
	.path string
	.hash string
]=]
export type URL = {
	isValid: boolean;
	href: string;
	protocol: string;
	port: string?;
	hostname: string;
	host: string;
	pathname: string;
	search: string;
	searchParams: { [string]: string };
	path: string;
	hash: string;
	toJSON: (any) -> string;
	Update: (any, key: string, value: any) -> nil;
	Destroy: (any) -> nil;
}

--[=[
	Request Config for the request
	@interface RequestConfig
	@within BloxiosInstance

	.url string
	.urlObject URL
	.method string
	.baseURL string
	.headers {[string]: string}
	.cookies {[string]: string}
	.params {[string]: any}
	.data {[string]: any}
	.instance BloxiosInstance
]=]
export type RequestConfig = {
	url: string?;
	urlObject: URL?;
	method: string?;
	baseURL: string?;
	headers: { [string]: string }?;
	cookies: { [string]: string }?;
	params: { [string]: any }?;
	data: { [string]: any }?;
	instance: {any}?;
}

--[=[
	The response schema for requests
	@interface ResponseSchema
	@within BloxiosInstance

	.data {[string]: any}
	.status number
	.statusText string
	.headers {[string]: string}
	.config RequestConfig
]=]
export type ResponseSchema = {
	data: { [string]: any};
	status: number;
	statusText: string;
	headers: { [string]: string };
	config: RequestConfig;
}	

return {}
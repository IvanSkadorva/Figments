response = ngx.location.capture (
                        '/backend/channels', { 
                            always_forward_body = true, 
                            copy_all_vars = true})

if response.status > 500 then 
    ngx.exit(response.status)
end

local cjson = require("cjson")
channels = cjson.decode(response.body)


local template = require "resty.template";
local template_string = ngx.location.capture("/templates/lua/channels.html")

template.render(template_string.body, {
    items = channels
})          
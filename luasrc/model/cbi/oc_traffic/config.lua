local o = require "luci.dispatcher"
local cbi = require "luci.model.cbi"

return cbi("oc_traffic/config", {
    title = "OpenClash Traffic Monitor",
    description = "Configure traffic monitoring settings for OpenClash"
})

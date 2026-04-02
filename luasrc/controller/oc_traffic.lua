module("luci.controller.oc_traffic", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/oc_traffic") then
        return
    end

    entry({"admin", "services", "oc_traffic"}, alias("admin", "services", "oc_traffic", "status"), _("OpenClash Traffic"), 30).dependent = true
    entry({"admin", "services", "oc_traffic", "status"}, template("oc_traffic/status"), _("Status"), 10).leaf = true
    entry({"admin", "services", "oc_traffic", "config"}, cbi("oc_traffic/config"), _("Settings"), 20).leaf = true
    entry({"admin", "services", "oc_traffic", "api"}, call("api_handler")).leaf = true
end

function api_handler()
    local http = require "luci.http"
    local api_action = http.formvalue("action")
    
    http.prepare_content("application/json")
    
    if api_action == "traffic_data" then
        http.write_json(get_traffic_data())
    elseif api_action == "settings" then
        http.write_json(get_settings())
    else
        http.write_json({error = "Unknown action"})
    end
end

function get_traffic_data()
    local data_file = "/var/lib/oc_traffic/current.json"
    local rrd_file = "/var/lib/oc_traffic/traffic.rrd"
    
    if nixio.fs.access(data_file) then
        local f = io.open(data_file, "r")
        if f then
            local content = f:read("*all")
            f:close()
            return {success = true, data = content}
        end
    end
    
    return {success = false, error = "No data available"}
end

function get_settings()
    local uci = require "luci.model.uci".cursor()
    local settings = {}
    
    uci:foreach("oc_traffic", "settings", function(s)
        settings.collection_interval = s.collection_interval or "300"
        settings.data_retention_days = s.data_retention_days or "45"
        settings.memory_limit = s.memory_limit or "20"
        settings.cpu_limit = s.cpu_limit or "5"
    end)
    
    return {success = true, settings = settings}
end

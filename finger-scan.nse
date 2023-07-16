-- HEAD
local comm = require "comm"
local shortport = require "shortport"

description = [[
  Script for finger service
]]

author = "jdk"

license = "Same as NMAP"

categories = {"safe"}

-- RULES

portrule = shortport.port_or_service(79,"finger")

-- ACTION

action = function(host, port)
    local try = nmap.new_try()
 
    return try(comm.exchange(host, port, "\r\n", {lines=100, 
    proto=port.protocol, timeout=5000}))
end

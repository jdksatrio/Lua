-- HEAD

local nmap = require "nmap"
local shortport = require "shortport"

description = [[
  "My first script"
]]

author = "jdk"

license = "Same as Nmap--See https://nmap.org/book/man-legal.html"

categories = {"safe"}

-- RULE

portrule = function(host, port)
    local port_to_check = { number = 4000, protocol = "tcp" }
    local port_state = nmap.get_port_state(host, port_to_check)
 
    return port_state ~= nil
        and port_state.state == "open"
end

-- ACTION

action = function(host,port)
  return "The port is open"
end

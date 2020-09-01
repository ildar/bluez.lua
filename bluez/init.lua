local lgi = require 'lgi'
local Gio = lgi.require 'Gio'

local bluez = {}

local bus = Gio.bus_get_sync(Gio.BusType.SYSTEM)
bluez.server = Gio.DBusObjectManagerClient.new_sync(
  bus,
  Gio.DBusObjectManagerClientFlags.NONE,
  "org.bluez", "/")

function bluez.get_adapters()
  -- FIXME: should be implemented through interfaces (?)
  local adapters = {}
  local objs = bluez.server:get_objects()
  for i=1,#objs do
    local path = objs[i]:get_object_path()
    local last_elem = path:gsub(".+/","")
    if last_elem:sub(1,3) == "hci" then
      adapters[#adapters+1] = objs[i]
    end
  end
  return adapters
end

return bluez

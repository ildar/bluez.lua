local bluez = require 'bluez'

describe("Linux Bluetooth module", function()
  it("can connect to the bluez service",
    function()
      local server = bluez.server
      assert.truthy(server)
      local objs = server:get_objects()
      assert.truthy(#objs > 0)
    end)

  it("can see some adapters",
    function()
      local adapters = bluez.get_adapters()
      assert.truthy (#adapters > 0)
    end)

  it("can discover BLE devices",
    function()
      assert.truthy (false)
    end)

  it("can browse a BLE device",
    function()
      assert.truthy (false)
    end)

end)
  

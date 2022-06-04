local internet = require("internet")
local fs = require("filesystem")
local eeprom = require("component").eeprom

--status("downloading efi")
internet.download("https://raw.githubusercontent.com/igorkll/topBiosV5/main/smartEfi.bin", "/.efi")
local efiLoader = internet.request("https://raw.githubusercontent.com/igorkll/topBiosV5/main/smartEfiLoader.bin")

--status("installing efi")
--saveFile("/.efi", efiCode)
local file = fs.open("/.efiData", "wb")
file:write(fs.get("/").address)
file:close()

eeprom.setData(fs.get("/").address)
eeprom.set(efiLoader)

computer.shutdown(true)

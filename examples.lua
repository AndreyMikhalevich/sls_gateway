--Получение списка всех устройств из devices.json, вывод последнего времени в сети и разницы с текущим 
local currentTime = os.time()
local devJson = os.fileRead("/int/devices.json")
for id, obj in devJson:gmatch('"(.-)"%s*:%s*(%b{})') do
  local addr = obj:match('"ieeeAddr"%s*:%s*"([^"]+)"')
  local last = obj:match('"last_seen"%s*:%s*(%d+)')
  local delta = currentTime - last
  if addr and last then
    print(("ieeeAddr: %s\tlast_seen: %s \tdelta: %s"): format(addr, last, delta)   )
  end
end

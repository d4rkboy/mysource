do

-- Returns true if is not empty
local function has_usage_data(dict)
  if (dict.usage == nil or dict.usage == '') then
    return false
  end
  return true
end

-- Get commands for that plugin
local function plugin_help(name)
  local plugin = plugins[name]
  if not plugin then return nil end

  local text = ""
  if (type(plugin.usage) == "table") then
    for ku,usage in pairs(plugin.usage) do
      text = text..usage..'\n'
    end
    text = text..'\n'
  elseif has_usage_data(plugin) then -- Is not empty
    text = text..plugin.usage..'\n\n'
  end
  return text
end

-- !help command
local function telegram_help()
  local text = "لیست دستورات ربات: \n\n"
  -- Plugins names
  for name in pairs(plugins) do
    text = text..name..'\n'
  end
  text = text..'\n'..'برای دریافت راهنمای هر دستور از ؟ اسم دستور استفاده کنید'
  text = text..'\n'..'Or "بعضی از دستورات راهنما ندارن'
  return text
end

-- !help all command
local function help_all()
  local ret = ""
  for name in pairs(plugins) do
    ret = ret .. plugin_help(name)
  end
  return ret
end

local function run(msg, matches)
  if matches[1] == "!help" then
    return telegram_help()
  elseif matches[1] == "!help all" then
    return help_all()
  else 
    local text = plugin_help(matches[1])
    if not text then
      text = telegram_help()
    end
    return text
  end
end

return {
  description = "Help plugin. Get info from other plugins.  ", 
  usage = {
  
    "? [plugin name]"
  },
  patterns = {
    "^?$",
    --"^!help all",
    "^? (.+)"
  }, 
  run = run 
}

end

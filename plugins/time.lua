function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = '⌚️ساعت<><><><>'..jdat.FAtime..' \nامروز '..jdat.FAdate..'است \n    —--\n⌚️Time :'..jdat.ENtime..'\n📆Today : '..jdat.ENdate.. '\n@PowerShield_CH'
return text
end
return {
  patterns = {"^[/!]([Tt][iI][Mm][Ee])$"}, 
run = run 
}

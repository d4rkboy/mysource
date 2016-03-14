local function run(msg, matches)
    if msg.text == "salam" then
      if is_sudo(msg) then
        return "salam baba"
      else
        return "سلام"
      end
    elseif msg.text == "بای" then
      if is_sudo(msg) then
        return " by baba"
      else
        return "خداحافظ"
      end
    elseif msg.text == "سلام" then
      if is_sudo(msg) then
        return " salam bab "
      else
        return "سلام "
        end
    elseif msg.text == "bye" then
      if is_sudo(msg) then
        return " bye baba"
      else
        return "خدا نگه دار"
      end
    elseif msg.text == "دخترم" then
      if is_sudo(msg) then
        return " بله بابا "
      else
        return "گوه بخور "
        end
    end
end
return {
	patterns = {
"^salam",
"^بای",
"^سلام",
"^bye",
"^دخترم",
},
run = run,
}

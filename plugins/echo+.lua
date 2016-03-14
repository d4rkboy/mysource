do

function run(msg, matches)
  return "." .. matches[1]
end

return {
  description = "echo plugin ", 
  usage = "echo+ ",
  patterns = {
    "^echo(.*)$",
  }, 
  run = run 
}

end

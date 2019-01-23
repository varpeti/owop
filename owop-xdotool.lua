local ourworldofpixels = {}

ourworldofpixels.XX=1920
ourworldofpixels.YY=1080
ourworldofpixels.CX=ourworldofpixels.XX/2
ourworldofpixels.CY=ourworldofpixels.YY/2

function ourworldofpixels.init()
    return 
[[
# Exit if not runs from a terminal.
test -t 0 || exit 1

# When killed, run stty sane.
trap 'stty sane; exit' SIGINT SIGKILL SIGTERM

# When exits, kill this script and it's child processes (the loop).
trap 'kill 0' EXIT

# Do not show ^Key when press Ctrl+Key.
stty -echo -icanon -icrnl time 0 min 0

# Wait
sleep 3

# Draw
xdotool click 1 ]]
end

function ourworldofpixels.close()
    return
[[


# Pause until reads a character.
read -n 1

# Exit.
exit 0
]]
end

function ourworldofpixels.click(x,y)
    return ("mousemove "..x.." "..y.." click --delay 125 1 ")
end

function ourworldofpixels.key(k,r)
    r = r or "1"
    return ("key --delay 10 --repeat "..r.." "..k.." ")
end

function ourworldofpixels.text(s)
    return ("type --delay 10 "..s.."\nxdotool ")
end

function ourworldofpixels.sleep(s)
    return ("sleep "..s.." ")
end

function ourworldofpixels:setColor(rr,gg,bb)
    local ret = ""

    ret=ret..self.key("f")
    ret=ret..self.sleep(1)

    ret=ret..self.text(rr..","..gg..","..bb)
    ret=ret..self.key("Return")
    ret=ret..self.sleep(1)
    return ret
end

return ourworldofpixels
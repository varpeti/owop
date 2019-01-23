local owop = require("owop.xdotool")
local readImg = require("readImg")

local function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function estimateTime(img)
    local time = 0
    for ic,c in pairs(img) do
        cc = split(ic," ")
        if not (tonumber(cc[1])>250 and tonumber(cc[2])>250 and tonumber(cc[3])>250) then
            time=time+2020
            for ip,p in ipairs(c) do
                time=time+125
            end
        end
    end
    return time
end

function draw(img)
    for ic,c in pairs(img) do
        cc = split(ic," ")
        if not (tonumber(cc[1])>250 and tonumber(cc[2])>250 and tonumber(cc[3])>250) then
            io.write(owop:setColor(cc[1],cc[2],cc[3]))
            for ip,p in ipairs(c) do
                io.write(owop.click(70+p.x,134+p.y)) -- (1920x1080) if u stand in origo its the x:-890 y:-440
            end
        end
    end
end

function love.load(arg)
    local img1,img2 = {}
    if arg[1] then 
        img1,img2 = readImg.read(arg[1])
    else 
        print("Usage: love . img >out.file")
    end
    print("#!/bin/bash\n")
    print("echo 'Estimated time: "..((estimateTime(img1)+estimateTime(img2))/1000).." sec'\n")

    io.write(owop.init())
    draw(img1);
    draw(img2);
    io.write(owop.close())

    love.event.quit()
end
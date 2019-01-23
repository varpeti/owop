local owop = require("owop-js")
local readImg = require("readImg")

local function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function estimateTime(img)
    return #img*125
end

function draw(img)
    for ic,c in pairs(img) do
        io.write(owop.click(c));
    end
end

function love.load(arg)
    local img1,img2 = {}
    if arg[1] then 
        img1,img2 = readImg.read(arg[1])
    else 
        print("Usage: love . img >out")
        love.event.quit()
        return
    end
    --print("Estimated time: "..((estimateTime(img1)+estimateTime(img2))/1000).." sec")

    draw(img1);
    draw(img2);

    love.event.quit()
end
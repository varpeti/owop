local ourworldofpixels = {}

ourworldofpixels.XX=1920
ourworldofpixels.YY=1080
ourworldofpixels.CX=ourworldofpixels.XX/2
ourworldofpixels.CY=ourworldofpixels.YY/2


function ourworldofpixels.click(c)
    if c.color.rr==255 and c.color.gg==255 and c.color.bb==255 then return "" end
    return (c.x..";"..c.y..";"..c.color.rr..";"..c.color.gg..";"..c.color.bb.."\n")
end

return ourworldofpixels
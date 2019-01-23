local readImg = {}

function readImg.read(fname)
    local img1 = {}
    local img2 = {}

    local d = love.image.newImageData(fname)
    for x=0,d:getWidth()-1 do
        for y=0,d:getHeight()-1 do
            local rr,gg,bb,aa = d:getPixel(x,y)
            rr=math.floor(rr*255) gg=math.floor(gg*255) bb=math.floor(bb*255)
            if type(img1[rr.." "..gg.." "..bb])~="table" then img1[rr.." "..gg.." "..bb]={} end
            if type(img2[rr.." "..gg.." "..bb])~="table" then img2[rr.." "..gg.." "..bb]={} end
            if x%2==y%2 
            then
                table.insert(img1[rr.." "..gg.." "..bb],{x=x,y=y})
            else
                table.insert(img2[rr.." "..gg.." "..bb],{x=x,y=y})
            end
        end
    end
    return img1,img2 -- its splited in two by checker pattern
end

return readImg


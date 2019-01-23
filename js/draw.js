var px_start_pos = [80,30];
var px_i = 0;
var px_px = [];
var px_next_time = 0;

//loop thrugh points
function px_loop() 
{
    //if it isn't time chenk again later
    if (px_next_time> (new Date().getTime()) )
    {
        setTimeout(px_loop, Math.floor((Math.random() * 125) + 1) );
        return;
    }
    //if its time

    //simulate mouse movement
    var event = document.createEvent("MouseEvent");
    event.initMouseEvent("mousemove", true, true, window, 0, px_px[px_i][0]+px_start_pos[0], px_px[px_i][1]+px_start_pos[1], px_px[px_i][0]+px_start_pos[0], px_px[px_i][1]+px_start_pos[1], false, false, false, false, 0, null);
    document.getElementById("animations").dispatchEvent(event);
    
    //set pixel
    OWOP.world.setPixel(OWOP.mouse.tileX, OWOP.mouse.tileY, px_px[px_i][2])
    
    //set new time and next point
    px_next_time= (new Date().getTime())+150;
    px_i++;

    //if any point is left continue
    if (px_i<px_px.length) setTimeout(px_loop, Math.floor((Math.random() * 125) + 1) );
}

//input file
var px_file = document.createElement("input");
px_file.setAttribute("type","file");
px_file.setAttribute("name","file");
px_file.onchange = function()
{
    var file = this.files[0];
    
    var reader = new FileReader();
    reader.onload = function(progressEvent)
    {
        px_px=[];
        var lines = this.result.split('\n');
        for(var line = 0; line < lines.length; line++)
        {
            var nums = lines[line].split(";");
            px_px.push([1*nums[0], 1*nums[1], [ 1*nums[2],1*nums[3],1*nums[4] ] ]);
        }
        px_i=0;
        px_loop();
    }
  reader.readAsText(file);
};
px_file.style.position="relative";
px_file.style.zIndex=100;
px_file.style.float="right";
document.body.appendChild(px_file);
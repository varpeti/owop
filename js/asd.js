var px_i = 0;
var px_start_pos = [80,30];

function px_loop() 
{
    var event = document.createEvent("MouseEvent");
    event.initMouseEvent("mousemove", true, true, window, 0, px_px[px_i][0]+px_start_pos[0], px_px[px_i][1]+px_start_pos[1], px_px[px_i][0]+px_start_pos[0], px_px[px_i][1]+px_start_pos[1], false, false, false, false, 0, null);
    document.getElementById("animations").dispatchEvent(event);
    
    console.log(px_px[px_i][0], px_px[px_i][1], OWOP.mouse.tileX, OWOP.mouse.tileY, OWOP.world.setPixel( OWOP.mouse.tileX, OWOP.mouse.tileY, px_px[px_i][2]) );
    if (px_i<px_px.length-1) setTimeout(px_loop, 125);   
    px_i++;
}

function px_start()
{
    px_i = 0;
    px_loop();
}

var px_px = [ [0,0,[0,0,0]], [0,1,[0,0,0]], [0,2,[0,0,0]], [0,3,[0,0,0]], [0,4,[0,0,0]], [0,5,[0,0,0]], [0,6,[0,0,0]], [0,7,[0,0,0]], [0,8,[0,0,0]], [0,9,[0,0,0]], [0,10,[0,0,0]], [0,11,[0,0,0]], [0,12,[0,0,0]], [0,13,[0,0,0]], [0,14,[0,0,0]], [0,15,[0,0,0]], [0,16,[0,0,0]], [0,17,[0,0,0]], [0,18,[0,0,0]], [0,19,[0,0,0]], [0,20,[0,0,0]], [0,21,[0,0,0]], [0,22,[0,0,0]], [0,23,[0,0,0]] ];

View.Set ("graphics:max;max,offscreenonly,nobuttonbar,position:center;center,title:Brick Breaker")

var counter : int
counter := 0


process playstuff
    loop
	counter := counter + 1
	Music.PlayFile ("ocean53.wav")
	exit when counter = 3
    end loop
end playstuff

fork playstuff

View.Set ("graphics,offscreenonly")
setscreen ("graphics:640,480")
var c : int := 0 % Counter


for hi : 1 .. 640     % for statement for boat


    %
    var col : int        % randoming colour for steam
    randint (col, 1, 225)

    %
    View.Update
    %
    if c >= 0 then
	c := c + 2
    end if            % creating a if statement for my waves to go up and down
    if c > 10 then
	c := c - 4
    end if
    %
    %
    delay (100)
    %backround
    drawfillbox (0, 0, 640, 480, black)
    %ocean
    drawfillbox (0, 0, 640, 130, blue)
    %ocean waves
    drawfilloval (0, c, 170, 170, blue)
    drawfilloval (100, c, 170, 170, blue)
    drawfilloval (200, c, 170, 170, blue)
    drawfilloval (300, c, 170, 170, blue)
    drawfilloval (400, c, 170, 170, blue)
    drawfilloval (500, c, 170, 170, blue)
    drawfilloval (600, c, 170, 170, blue)
    drawfilloval (700, c, 170, 170, blue)

    %moon
    drawfilloval (640, 400, 70, 70, gray)
    % stars
    drawfillstar (300, 360, 340, 310, yellow)
    drawfillstar (100, 360, 140, 310, yellow)
    drawfillstar (200, 320, 240, 280, yellow)
    drawfillstar (430, 320, 470, 280, yellow)
    drawfillstar (510, 360, 550, 310, yellow)
    %
    %clouds
    drawfilloval (70, 400, 30, 30, darkgray)
    drawfilloval (90, 410, 30, 30, darkgray)
    drawfilloval (120, 400, 30, 30, darkgray)
    drawfilloval (100, 400, 30, 30, darkgray)
    drawfilloval (120, 410, 30, 30, darkgray)
    drawfilloval (150, 400, 30, 30, darkgray)
    %clouds2
    drawfilloval (400, 400, 30, 30, darkgray)
    drawfilloval (420, 410, 30, 30, darkgray)
    drawfilloval (450, 400, 30, 30, darkgray)
    drawfilloval (430, 400, 30, 30, darkgray)
    drawfilloval (450, 410, 30, 30, darkgray)
    drawfilloval (480, 400, 30, 30, darkgray)
    %boat
    drawfillarc (100 + hi, 230, 100, 70, 180, 360, red)
    %mapleleaf
    Draw.FillMapleLeaf (80 + hi, 170, 130 + hi, 220, white)
    % box 1 on boat
    drawfillbox (180 + hi, 230, 60 + hi, 270, blue)
    % box 2 on boat
    drawfillbox (100 + hi, 270, 150 + hi, 290, green)
    % steam pipe on boat
    drawfillbox (130 + hi, 291, 150 + hi, 340, blue)
    %steam from boat
    drawfilloval (70 + hi, 355, 20, 20, col)
    drawfilloval (90 + hi, 370, 20, 20, col)
    drawfilloval (120 + hi, 360, 20, 20, col)

    % bird


    for decreasing a : 320 .. 317
	Draw.Arc (a, 400, 50, 20, 90, 180, brightred)
    end for

    for decreasing a1 : 220 .. 217
	Draw.Arc (a1, 400, 50, 20, 0, 90, brightred)
    end for

    View.Update

end for

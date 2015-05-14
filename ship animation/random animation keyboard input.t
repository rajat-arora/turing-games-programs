View.Set ("offscreenonly")
var key : array char of boolean
var y : int
y := 200
var x : int
x := 100
var c : int := 0 % Counter
var col : int
loop
    % randoming colour for steam
    randint (col, 1, 225)

    Input.KeyDown (key)
    if key (KEY_RIGHT_ARROW) = true then
	x := x + 5
    end if
    if key (KEY_LEFT_ARROW) = true then
	x := x - 3
    end if
    if key (KEY_DOWN_ARROW) = true then
	y := y - 5
    end if
    if key (KEY_UP_ARROW) = true then
	y := y + 1
    end if

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

    %boat.................................................
    drawfillarc (100 + x, 230, 100, 70, 180, 360, red)
    %mapleleaf
    Draw.FillMapleLeaf (80 + x, 170, 130 + x, 220, white)
    % box 1 on boat
    drawfillbox (180 + x, 230, 60 + x, 270, blue)
    % box 2 on boat
    drawfillbox (100 + x, 270, 150 + x, 290, green)
    % steam pipe on boat
    drawfillbox (130 + x, 291, 150 + x, 340, blue)
    %steam from boat
    drawfilloval (70 + x, 355, 20, 20, col)
    drawfilloval (90 + x, 370, 20, 20, col)
    drawfilloval (120 + x, 360, 20, 20, col)
    View.Update
    cls
    delay (5)
end loop

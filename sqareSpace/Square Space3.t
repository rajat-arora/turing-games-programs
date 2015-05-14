View.Set ("graphics:max;max,offscreenonly,nobuttonbar,position:center;center,title:Square Space")
var key : array char of boolean
var counterMain, counterLoop, timeLoop, d := 0
d := 10
const X := maxx / 2
const Y := maxy / 2
const squareMoveIncrease := 10
const squareAmount := 50
const squareColour := 7
const squareZStart := 0.4
const squareBaseSize := 25
var squareBaseX, squareBaseY, squareZ, squareA : array 1 .. squareAmount of real
var squareVertexX, squareVertexY : array 1 .. 4, 1 .. squareAmount of int
for f : 1 .. squareAmount
    squareBaseX (f) := Rand.Int (-round (X / squareZStart), round (X / squareZStart))
    squareBaseY (f) := Rand.Int (-round (Y / squareZStart), round (Y / squareZStart))
    squareA (f) := Rand.Int (0, 45)
end for

loop
    Input.KeyDown (key)
    if key (KEY_ESC) then
	quit
    end if
    if key (KEY_UP_ARROW) then
	for f : 1 .. squareAmount
	    squareBaseY (f) -= squareMoveIncrease
	end for
    end if
    if key (KEY_DOWN_ARROW) then
	for f : 1 .. squareAmount
	    squareBaseY (f) += squareMoveIncrease
	end for
    end if
    if key (KEY_RIGHT_ARROW) then
	for f : 1 .. squareAmount
	    squareBaseX (f) -= squareMoveIncrease
	end for
    end if
    if key (KEY_LEFT_ARROW) then
	for f : 1 .. squareAmount
	    squareBaseX (f) += squareMoveIncrease
	end for
    end if

    %Draw.Line (0, round (Y), maxx, round (Y), 7)
    %Draw.Line (round (X), 0, round (X), maxy, 7)

    for f : 1 .. squareAmount
	squareA (f) += 0.7
	if squareA (f) > 90 then
	    squareA (f) := 89.99999
	end if
	squareZ (f) := squareZStart + 0.2 * tand (squareA (f))

	squareVertexX (1, f) := round (X + squareZ (f) * (squareBaseX (f) + squareBaseSize))
	squareVertexX (2, f) := round (X + squareZ (f) * (squareBaseX (f) + squareBaseSize))
	squareVertexX (3, f) := round (X + squareZ (f) * (squareBaseX (f) - squareBaseSize))
	squareVertexX (4, f) := round (X + squareZ (f) * (squareBaseX (f) - squareBaseSize))
	squareVertexY (1, f) := round (Y + squareZ (f) * (squareBaseY (f) + squareBaseSize))
	squareVertexY (2, f) := round (Y + squareZ (f) * (squareBaseY (f) - squareBaseSize))
	squareVertexY (3, f) := round (Y + squareZ (f) * (squareBaseY (f) - squareBaseSize))
	squareVertexY (4, f) := round (Y + squareZ (f) * (squareBaseY (f) + squareBaseSize))

	for g : 1 .. 3
	    Draw.Line (squareVertexX (g, f), squareVertexY (g, f), squareVertexX (g + 1, f), squareVertexY (g + 1, f), squareColour)
	end for
	Draw.Line (squareVertexX (4, f), squareVertexY (4, f), squareVertexX (1, f), squareVertexY (1, f), squareColour)

	if squareVertexX (1, f) < 0 or squareVertexX (4, f) > maxx or squareVertexY (1, f) < 0 or squareVertexY (2, f) > maxy then
	    squareBaseX (f) := Rand.Int (-round (X / squareZStart), round (X / squareZStart))
	    squareBaseY (f) := Rand.Int (-round (Y / squareZStart), round (Y / squareZStart))
	    squareA (f) := 0
	end if

    end for

    counterMain += 1
    timeLoop := Time.Elapsed - timeLoop
    counterLoop := counterMain - counterLoop
    put round (counterLoop / timeLoop * 1000)
    %put round (counterMain / Time.Elapsed * 1000)
    View.Update
    Time.DelaySinceLast (d)
    cls
end loop

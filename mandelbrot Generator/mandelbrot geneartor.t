View.Set ("graphics:645;645,nobuttonbar,position:300;300")
proc AddGradient (c1, c2, n : int)
   var clr : int
   var r1, g1, b1 : real
   var r2, g2, b2 : real
   var p, p0 : real
   RGB.GetColor (c1, r1, g1, b1)
   RGB.GetColor (c2, r2, g2, b2)
   const a := 50
   for i : 1 .. n
       p := (i / n) * 100
       p0 := 100 - p
       clr := RGB.AddColor ((((r1 * p) + (r2 * p0)) / 2) / a, (((g1 * p) + (g2 * p0)) / 2) / a, (((b1 * p) + (b2 * p0)) / 2) / a)
   end for
end AddGradient
%ColorAdd (yellow, blue, 25)
% ColorAdd (brightblue,brightgreen,5)
% ColorAdd (brightgreen,yellow,5)
% ColorAdd (yellow,13,5)
% ColorAdd (13,brightred,5)
AddGradient (9, 7, 28)
AddGradient (12, 9, 100)
AddGradient (14, 12, 118)
AddGradient (0, 14, 10)

function distance (x1, y1, x2, y2 : real) : real
   result ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
end distance
var ox, oy : real := maxx div 2

type complex :
   record
       r : real
       i : real
   end record

function AddComplex (comp1, comp2 : complex) : complex
   var hold : complex
   hold.r := comp1.r + comp2.r
   hold.i := comp1.i + comp2.i
   result hold
end AddComplex
function MultComplex (comp1, comp2 : complex) : complex
   var hold : complex
   hold.r := (comp1.r * comp2.r) - (comp1.i * comp2.i)
   hold.i := (comp1.r * comp2.i) + (comp1.i * comp2.r)
   result hold
end MultComplex
function Iterate (comp1 : complex, C : complex) : complex
   var hold : complex
   hold := MultComplex (comp1, comp1)
   hold := AddComplex (hold, C)
   result hold
end Iterate
var maxI : int := 100
var count : int := 0
var dwell : array 0 .. maxx * 3, 0 .. maxy * 3 of real
var transX, transY : int := maxx div 2

var c : complex
c.r := -0.79
c.i := 0.16

var hold : complex

   for x : -transX .. maxx
       for y : -transY .. maxy
	   hold.r := x / (maxx div 2)
	   hold.i := y / (maxy div 2)
	   loop
	       count += 1
	       exit when count >= maxI
	       if distance (hold.r, hold.i, ox, oy) <= maxx div 1.3 then
		   hold := Iterate (hold, c)
	       else
		   exit
	       end if
	   end loop
	   dwell (x + maxx, y + maxy) := count
	   drawdot ((x + transX) div 1, (y + transY) div 1, 255 + round ((dwell (x + maxx, y + maxy) / maxI) * 100))
	   count := 0
       end for
   end for
%
% for x : 1 .. maxx
%     for y : 1 .. maxy
%         % if dwell (x, y) = maxI then
%         %     drawdot (x, y, 7)
%         % else
%
%         % end if
%     end for
% end for
%

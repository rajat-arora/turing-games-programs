
var counter : int
counter := 0

View.Set ("graphics,offscreenonly")
setscreen ("graphics:640,480")

   
    
    
loop
counter := counter + 12
View.Update
drawfillbox (100+counter, 100, 300 +counter, 300, 10)
delay (1000)
View.Update
cls

end loop

% for hi : 1..545
%  cls
%  delay (5)
% drawfilloval (70 + hi, 355, 30, 30, blue)
% View.Update
% exit when hi = 545
% end for



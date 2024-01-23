% Timer that takes off 5 HP ever 5 moves
% see dependency report for input output
HPtimer = HPtimer + 1;
if HPtimer == 5
    PHealthPoint=PHealthPoint-5;
    
    Message = sprintf('You are using up energy from moving. You lost 5 HP points Player HP is:%d',PHealthPoint);
    g = msgbox(Message);
    pause (2)
    % menu(strcat("You are using up energy from moving. You lost 5 HP points Player HP is:", num2str(PHealthPoint)))
    HPtimer = 0 ;
end

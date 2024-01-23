% Checks if the spot is availible
if MBoard(row,col)==0
    available=true;     %Space opened for player
else
    available = false; %Prevent player from taking same space
    disp('pick again')
end 

function UpdateHealth(healthUD)
% UPDATEHEALTH: updates health
% see dependency report for input output
if PHealthPoint == 100
    updated = true;
elseif PHealthPoint == 0
    update = false;
else 
    choice = randi(1,2)
    healthupdate = healthUD
    PHealthPoint= PHealthPoint + healthupdated
end

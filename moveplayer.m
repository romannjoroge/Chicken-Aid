function [Mboard, Gboard]= moveplayer (Pposition, mboard, gboard, player, playerID, type)
%MOVEPLAYER: moves player OR NPC's one square on map
%   Must input grass, and player (which are png files) to be able to change
%   Gboard visualy

if(type== "player")
[oldposition1,oldposition2] = find(mboard==playerID);
[Pposition(1), Pposition(2)] = OutOfBounds(Pposition(1), Pposition(2),oldposition1,oldposition2, type , mboard);
end
mboard(Pposition(1), Pposition(2)) = playerID; % sum(double('player')) = PLAYERID
gboard{Pposition(1), Pposition(2)} = player;
Mboard = mboard;
Gboard = gboard;
end


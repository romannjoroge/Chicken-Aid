
function [Mboard, Gboard] = drop(itemID,itemPics, itemFreq,mboard, gboard, npcType)%itemList needed to generate pictures
% DROP: weapons/food/npcs randomly onto mboard calls PLACE
% see dependency report for input output
for i=1:length(itemID)
[gboard, mboard]= place(mboard,gboard,itemID(i),itemPics{i}, itemFreq(i), npcType(i));
end
Gboard = gboard;
Mboard = mboard;
end

       

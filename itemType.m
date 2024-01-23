
function [index, type] = itemType(itemID,itemWID,itemFID,npcID)
% ITEMTYPE: determines the item type of an object the player bumps into

id = uint16(itemID) + 1
itemWID = itemWID+1
itemFID = itemFID+1
npcID = npcID+1
if find(itemWID==id)~=0% weapon type
    type = 'W';
    index = find(itemWID==id)
elseif find(itemFID==id)~=0
    type = 'F';
    index = find(itemFID==id)
elseif find(npcID==id)~=0
    type = 'N';
    index = find(npcID==id)
else
    type = "ERROR";
    index = 0
end


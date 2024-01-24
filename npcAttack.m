% ALL NPC attacks
[index, ~] = itemType(nID, [0,0], [0,0], npcID)
% Display fight options and get the new HP of player
PHealthPoint = Fightscrn(npcList(index), PHealthPoint, npcHP(index), npcATk(index), inventoryW,level,...
  npcList,itemListW, itemWhit, npcHP,npcATk);
if(PHealthPoint<=0)
    PHealthPoint = 0;
    d = length(npos);
% else
%     [Mboard, Gboard] = deleteOldPos(nPosOld,Mboard, Gboard, grass);
    %loadGB % show this because nposition changed permanently 
end

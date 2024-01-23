% Controls all player interactions with gameboard

PHealthPoint;
if(ptype=='N' && Mboard(prow, pcol)~= 0 && Mboard(prow,pcol) ~= playerID)
    loadGB(Gboard)
    if (npcType(npcID==Mboard(prow,pcol)) == "boss")
        PHealthPoint = Fightscrn(npcList(index), PHealthPoint, npcHP(index), npcATk(index), inventoryW,level,...
            npcList,itemListW, itemWhit, npcHP,npcATk);
        endscreen
    else
        PHealthPoint = Fightscrn(npcList(index), PHealthPoint, npcHP(index), npcATk(index), inventoryW,level,...
            npcList,itemListW, itemWhit, npcHP,npcATk);
        endscreen
        loadGB(Gboard)
        [Mboard, Gboard] = moveplayer(Pposition, Mboard, Gboard, player,playerID, "player");
        [Mboard, Gboard] = deleteOldPos(oldposition,Mboard, Gboard, grass);
        ATTACK = true;
    end
elseif(ptype == 'W'&& Mboard(prow, pcol)~= 0 && Mboard(prow,pcol) ~= playerID) %Weapons
    ATTACK = false;
    %given the ID number that we find on Mboard, I would find the position
    inventoryW(index) = itemListW(itemWID==Mboard(prow,pcol)); % inventory update
    [Mboard, Gboard] = moveplayer(Pposition, Mboard, Gboard, player, playerID, "player");
    [Mboard, Gboard] = deleteOldPos(oldposition,Mboard, Gboard, grass);
    
elseif(ptype == 'F'&& Mboard(prow, pcol)~= 0 && Mboard(prow,pcol) ~= playerID)%Food
    points = randi([itemFHunger(1, itemFID==Mboard(prow,pcol)),...
        itemFHunger(2,itemFID==Mboard(prow,pcol))], 1);
    PHealthPoint = points + PHealthPoint;
    Food = msgbox(strcat("You ate a ", itemListF(itemFID==Mboard(prow,pcol)), " you gained ",...
        num2str(points)," health. Your total health is: " , num2str(PHealthPoint)));
    uiwait(Food);
    [Mboard, Gboard] = moveplayer(Pposition, Mboard, Gboard, player, playerID, "player");
    [Mboard, Gboard] = deleteOldPos(oldposition,Mboard, Gboard, grass);
else
    PHealthPoint;
    if((Pposition(1) ~= 1 || Pposition(2) ~= 15)) % IF PLAYER HAS NOT REACHED THE END, move the player
        [Mboard, Gboard] = moveplayer(Pposition, Mboard, Gboard, player, playerID, "player");
        [Mboard, Gboard] = deleteOldPos(oldposition,Mboard, Gboard, grass);
    else
        Pposition(1) = oldposition(1);
        Pposition(2) = oldposition(2);
    end
    
    if(Mboard(1, 15) == 0)
     [Mboard, Gboard] = moveplayer([1, 15], Mboard, Gboard, itemFPic(4), npcID(4), "player");
    end
end
if(isempty(pcol) || isempty(prow))% if player is attacked by 2 enemies at once and player is consumed
    prow = oldposition(1)
    pcol = oldposition(2)
end
if((prow ==1 && pcol == 15) && (isempty(find(inventoryW=='keys'))))
    td = msgbox("Hey, kid, you don't have my key. Comeback when you have my key.", "TOAD");
    uiwait(td);
    
end
if(prow ==1 && pcol == 15 && ~(isempty(find(inventoryW=='keys'))))
    level = level + 1;
    endscreen
end

endscreen
loadGB(Gboard)


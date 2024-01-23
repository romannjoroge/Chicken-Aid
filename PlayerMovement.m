%% Player Movement/ UI
% prow and pcol always equals to the current location of player
% see dependency report for input output
[prow, pcol] = find(Mboard==sum(double('player')));
Pposition = [prow, pcol];
ed = false; % if ed is true, end game
oldLevel = level;
while ed == false
    h=figure(1);
    waitforbuttonpress
    move = get(h, 'CurrentKey');
    if(move ~= 0)
        oldposition = Pposition;
     
        inventoryW
        switch move
            case 'uparrow'
                setBehavior
                prow = prow-1;
                [prow,pcol] = OutOfBounds(prow, pcol,oldposition(1),oldposition(2), "player", Mboard);
                Pposition = [prow, pcol];
                [index, ptype]=itemType(Mboard(prow,pcol),itemWID,itemFID,npcID);
                if (Mboard(prow,pcol) == playerID)
                    continue;
                else
                    setBehavior
                    PlayerInteractCheck 
                end
                HPTimer
                loadGB(Gboard)             
                continue
            case 'downarrow'
                setBehavior
                ocol = pcol;
                prow = prow+1;
                [prow,pcol] = OutOfBounds(prow, pcol,oldposition(1),oldposition(2), "player", Mboard); %check if player is in bounds if not inbounds player does not move
                Pposition = [prow, pcol];
                [index, ptype] = itemType(Mboard(prow,pcol),itemWID,itemFID,npcID);
                if (Mboard(prow,pcol) == playerID)
                    continue;
                else
                    setBehavior
                    PlayerInteractCheck
                end
                loadGB(Gboard)
                HPTimer
                continue
            case 'leftarrow'
                setBehavior
                ocol = pcol;
                pcol = pcol-1;
                [prow,pcol] = OutOfBounds(prow, pcol,oldposition(1),oldposition(2), "player", Mboard);
                Pposition = [prow, pcol];
                [index, ptype]=itemType (Mboard(prow,pcol),itemWID,itemFID,npcID);
                if (Mboard(prow,pcol) == playerID)
                    continue;
                else
                    setBehavior
                    PlayerInteractCheck 
                end
                loadGB(Gboard)
                HPTimer
                continue
            case 'rightarrow'
                setBehavior
                ocol = pcol;
                pcol = pcol+1;
                [prow,pcol] = OutOfBounds(prow, pcol,oldposition(1),oldposition(2), "player", Mboard);
                Pposition = [prow, pcol];
                [index, ptype]=itemType (Mboard(prow,pcol),itemWID,itemFID,npcID);
                if (Mboard(prow,pcol) == playerID)
                    continue;
                else
                    setBehavior
                    PlayerInteractCheck
                end
                loadGB(Gboard)
                HPTimer
                continue
            case 'i'
                msgbox(inventoryW,'Your Inventory', 'help', 'modal') %show inventory
                continue;
        end
    end
end
 close all hidden

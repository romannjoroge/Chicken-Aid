% The movement/AI of NPC's

% 4 types of attackers: swarmer, picker,nester, tank
[nrow, ncol] = find(Mboard==nID);
npos = cell(1,length(nrow'));
for i = 1: length(nrow')
    npos{i} = [nrow(i), ncol(i)];
end
% finds npcID's corresponding picture
npic = itemNPCPic{1,npcID==nID};
% Now atkStyle:
switch atkStyle
    case "swarmer" % hornets
        %TODO: swarmers get stuck and stop moving, and also jumps
        for d = 1: length(npos) % moves every activeNPC type
            % Moves row
            nPosOld = [npos{d}(1),npos{d}(2)];
            if(moveRow == false)
                if(npos{d}(1) > Pposition(1))

                    tempNrow = npos{d}(1)-1;
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,npos{d}(2),npos{d}(1),npos{d}(2),"NPC", Mboard); % if out of bounds, address does not change
                elseif (npos{d}(1) < Pposition(1))

                    tempNrow = npos{d}(1)+1;
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,npos{d}(2),npos{d}(1),npos{d}(2), "NPC", Mboard); % if out of bounds, address does not change
                end
                % Moves col
            else
                if (npos{d}(2) > Pposition(2) && moveRow == true)
                    moveRow = false;
                    tempNcol = npos{d}(2)-1;
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(npos{d}(1),tempNcol,npos{d}(1),npos{d}(2), "NPC", Mboard); % if out of bounds, address does not change
                elseif (npos{d}(2) < Pposition(2)&& moveRow == true)
                    moveRow = false;
                    tempNcol = npos{d}(1)+1;
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(npos{d}(1),tempNcol,npos{d}(1),npos{d}(2), "NPC", Mboard);% if out of bounds, address does not change
                end
            end
                if Mboard(npos{d}(1),npos{d}(2)) == playerID
                    npcAttack;%attacks player
                    [Mboard, Gboard] = deleteOldPos(nPosOld,Mboard, Gboard, grass);
                    
                end
            %           NPC attacks player (if the player isn't already attacking):
            %           IN OTHER WORDS when NPC is not attacking,Mboard and Gboard only
            %           changes when the nposition changes
            if(nPosOld(1) ~= npos{d}(1) || nPosOld(2) ~= npos{d}(2)&& Mboard(npos{d}(1),npos{d}(2)) ~= playerID)
                [Mboard, Gboard] = moveplayer([npos{d}(1),npos{d}(2)], Mboard, Gboard, npic, nID,"NPC"); %use moveplayer to move NPCS
                [Mboard, Gboard] = deleteOldPos(nPosOld,Mboard, Gboard, grass);
            end
        end
%         end
    case "picker" % attacks if players are 1 space horizontally/vertically away
        for d = 1: length(npos)
            if((abs(npos{d}(1)-Pposition(1)) == 1 && npos{d}(2)== Pposition(2))...
                    || (abs(npos{d}(2)-Pposition(2)) == 1 && npos{d}(1)== Pposition(1)))
                npcAttack
                [Mboard, Gboard] = deleteOldPos(npos{d},Mboard, Gboard, grass);
            end
        end
    case "nester" %stays in relatively the same positions
        for d = 1: length(npos)
            tempNrow = npos{d}(1);
            tempNcol = npos{d}(2);
            nPosOld = [npos{d}(1), npos{d}(2)];
            % NON EDGE ROW AND COL NPC's
            if((tempNrow<10 && tempNrow>1) && (tempNcol<15 && tempNcol>1))
                if(moveRow == false) %rows
                    if(rstep == 1)
                        rstep = -1;
                        tempNrow = npos{d}(1)+rstep;
                    else % movement of row
                        rstep = 1;
                        tempNrow = npos{d}(1)+rstep;
                        [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,tempNcol, nPosOld(1),nPosOld(2),"NPC", Mboard);
                    end
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,tempNcol, nPosOld(1),nPosOld(2),"NPC", Mboard);
                    moveRow = true;
                end
                if(moveRow == true) % Moves col
                    if(npos{d}(2) >= 1 && cstep == 1)
                        cstep = -1;
                        tempNcol = npos{d}(2)+cstep;
                    else % movement of col
                        cstep = 1;
                        tempNcol = npos{d}(2)+cstep;
                    end
                    [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,tempNcol, nPosOld(1),nPosOld(2),"NPC", Mboard);
                    moveRow = false;
                end
                %             end
                %             IF ROW AND COL DID NOT MOVE: so all edge npcs or npcs with
                %             something in its way (that isn't the player)
            else

                % sets the movement scope(range) for npc's on edge rows and
                % columns
                % THIS IS SETS VALUES FOR EDGE NPC's
                if(tempNrow == 10 ||tempNrow == 1)
                    if(tempNrow==10)
                       rstep = -1;
                       tempNrow = npos{d}(1)+rstep;
                    else
                        rstep = 1;
                       tempNrow = npos{d}(1)+rstep;
                    end
                    moveRow = true;
                elseif (tempNcol == 15 || tempNcol == 1)
                    if(tempNcol==1)
                        cstep = 1;
                        tempNcol = npos{d}(2)+cstep;
                    else
                        cstep = -1;
                        tempNcol = npos{d}(2)+cstep;
                    end
                    moveRow = false;
                end
                [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,tempNcol, nPosOld(1),nPosOld(2),"NPC", Mboard);
            end
            [npos{d}(1),npos{d}(2)] = OutOfBounds(tempNrow,tempNcol, nPosOld(1),nPosOld(2),"NPC", Mboard);                
            if((npos{d}(1)~= nPosOld(1) || npos{d}(2)~=nPosOld(2)) && Mboard(npos{d}(1), npos{d}(2)) == 0)
                    [Mboard, Gboard] = moveplayer(npos{d}, Mboard, Gboard, npic, nID, "NPC"); %use moveplayer to move NPCS
                    [Mboard, Gboard] = deleteOldPos(nPosOld,Mboard, Gboard, grass);
            end
        end
end
clear nID atkStyle tempNrow tempNcol moveRow;



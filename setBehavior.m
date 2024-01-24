% sets behavior of npc's, moves the position of hornests, snakes and
% spiders and decides if should attack player

if(level == 1)
    rstep = 1
    cstep =1

    % Finds a hornest
    nID = npcID(find(npcList=="hornets"));
    atkStyle = npcType(find(npcList=="hornets"));
    moveRow = false; % used to alternate row and col moves
    NPCMovement
    
    nID = npcID(find(npcList=="snakes"));
    atkStyle = npcType(find(npcList=="snakes"));
    moveRow = false; % used to alternate row and col moves
    NPCMovement
    
    nID = npcID(find(npcList=="spiders"));
    atkStyle = npcType(find(npcList=="spiders"));
    moveRow = false; % used to alternate row and col moves
    NPCMovement
end
    

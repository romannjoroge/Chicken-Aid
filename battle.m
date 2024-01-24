% Returns player HP after battle
function [PlayerHP] = battle(PlayerHit, NPCHit,NPCHP, Playerhp)
%BATTLE: exchanges -HP until either the player or the NPC's health reaches
% 0
while(NPCHP > 0 && Playerhp > 0)
    % Remove damage from NPC health
    NPCHP = NPCHP + PlayerHit;
    if NPCHP <= 0
        PlayerHP = Playerhp;
        break
    end
    % Player takes NPCs damage
    Playerhp = Playerhp + NPCHit;
end
PlayerHP = Playerhp;
end


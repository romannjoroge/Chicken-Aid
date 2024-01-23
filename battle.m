function [PlayerHP] = battle(PlayerHit, NPCHit,NPCHP, Playerhp)
%BATTLE: exchanges -HP until either the player or the NPC's health reaches
% 0
% see dependency report for input output
while(NPCHP > 0 && Playerhp > 0)
    NPCHP = NPCHP + PlayerHit;
    if NPCHP <= 0
        PlayerHP = Playerhp;
        break
    end
    Playerhp = Playerhp + NPCHit;
end
PlayerHP = Playerhp;
end


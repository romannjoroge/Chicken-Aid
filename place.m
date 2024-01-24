function [Gboard, Mboard] = place(mboard, gboard, ItemID, ItemPic, Itemfreq, npcType)
% PLACE: places the NPC/items on the board randomly
%   NPC's can be placed by type.
for i = 1: Itemfreq 
    if(npcType == "boss") % for "boss" NPC's (I.E. the toad)
        gboard{1,15}= ItemPic;
        mboard(1,15) = ItemID;
    elseif (npcType == "nester") % for "nesters"/spiders
        % Find random row and column
        nrow = randi([2 6]);
        ncol = randi([2 8]);

        % Find a position with no monster
        while (mboard(nrow, ncol) ~= 0)
            nrow = randi([2 6]);
            ncol = randi([2 8]);
        end

        gboard{nrow,ncol}= ItemPic;
        mboard(nrow,ncol) = ItemID;
    else % everything else:
        nrow = randi([1 10]);
        ncol = randi([1 15]);

        % Find a position with no item
        while (mboard(nrow, ncol) ~= 0)
            nrow = randi([1 10]);
            ncol = randi([1 15]);
        end
        gboard{nrow,ncol}= ItemPic;
        mboard(nrow,ncol) = ItemID;
    end
end

Mboard = mboard;
Gboard = gboard;
end

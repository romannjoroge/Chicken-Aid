function [Mboard, Gboard]=deleteOldPos(oldPosition, mboard, gboard, grass)
% DELETEOLDPOS: deletes old position of items/players
% see dependency report for input output
if(mboard(oldPosition(1),oldPosition(2)) ~= 0)
    mboard(oldPosition(1),oldPosition(2))= 0;
    gboard{oldPosition(1), oldPosition(2)} = grass;
    Mboard = mboard;
    Gboard = gboard;
else
    Mboard = mboard;
    Gboard = gboard;
end
end

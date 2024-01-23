function [prow,pcol] = OutOfBounds(tprow,tpcol,oldposition1,oldposition2, type, mboard)
%OUTOFBOUNDS: checks if NPC or player is out of bounds
%   case player only checks if out of bounds
%   case "NPC" checks if out of bounds and if there is overlap
% see dependency report for input output
switch type
    case "player"
        if tprow >= 1 && tprow <= 10 && tpcol>=1 && tpcol <= 15
            prow = tprow;
            pcol = tpcol;
        else
            prow = oldposition1
            pcol = oldposition2
        end
    case "NPC"
        if tprow >= 1 && tprow <= 10 && tpcol>=1 && tpcol <= 15 ...
                && (mboard(tprow,tpcol) == 0 || mboard(tprow,tpcol) == sum(double(char('player')))) % FOR NPC's ALSO MAKES SURE THAT THERE IS NOTHING THERE
            prow = tprow;
            pcol = tpcol;
        else
            prow = oldposition1
            pcol = oldposition2
        end
    otherwise
        if tprow >= 1 && tprow <= 10 && tpcol>=1 && tpcol <= 15 ...
                && (mboard(tprow,tpcol) == 0 || mboard(tprow,tpcol) == sum(double(char('player')))) % FOR NPC's ALSO MAKES SURE THAT THERE IS NOTHING THERE
            prow = tprow;
            pcol = tpcol;
        else
            prow = oldposition1
            pcol = oldposition2
        end
        
end
end


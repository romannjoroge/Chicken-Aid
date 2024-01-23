
function Mboard = InputMBoard(itemName, row, col, board)
%INPUTMBOARD: called when someone needs to add a item placed on Mboard

itemID = sum(double(itemName)); %change itemName to ItemID
board(row, col) = itemID;
Mboard = board;
end


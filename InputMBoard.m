
function Mboard = InputMBoard(itemName, row, col, board)
%INPUTMBOARD: called when someone needs to add a item placed on Mboard
% see dependency report for input output
itemID = sum(double(itemName)); %change itemName to ItemID
board(row, col) = itemID;
Mboard = board;
end


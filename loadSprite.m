function [itemPicList] = loadSprite(itemList,type, level)
% LOADSPRITE: creates the sprite picture list
%   Uses the item type from ITEM TYPE (character W, F, or N)
%   to determine the location of it's corresponding picture.
%   see dependency report for input output
if(type == 'W')
    itemPicList = cell(1, size(itemList,2))
    for h=1:length(itemList)
        address = "All_Sprites_PNG\weapon\Weapon_"
        itemPicList{h} = imread(strcat(address,string(level),"_", string(h),".png"));
    end
    
elseif(type == 'F')
    itemPicList = cell(1, size(itemList,2))
    for h=1:length(itemList)
        address = "All_Sprites_PNG\food\Food_"
        itemPicList{h} = imread(strcat(address,string(level),"_", string(h),".png"));
    end
    
elseif(type == 'N')
    itemPicList = cell(1, size(itemList,2))
    for h=1:length(itemList)
        address = "All_Sprites_PNG\npc\npc_" %naming convention
        itemPicList{h} = imread(strcat(address,string(level),"_", string(h),".png"));
    end
end
end


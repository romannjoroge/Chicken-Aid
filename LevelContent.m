% Loads all level content in the game

ATTACK = false; % used to check whether or not a player is attack or being attacked
genericFreq = [1, 1, 1, 1, 1, 1];
genericType = [" "," "," "," "];
playerID = sum(double(char('player')));
player = imread('All_Sprites_PNG\player.png');
if (level == 1)
    % Gets images of weapons for the level
    itemListW = ["Rock", "Flash", "keys", "knife"];
    itemWPic = loadSprite(itemListW, 'W', level);

    % Gets images of food for the level
    itemListF = ["funGuy",  "Broccoli", "apple"];
    itemFPic = loadSprite(itemListF, 'F', level);
    itemFHunger = [3, 4, 15 ; 6, 4, 15];

    % Gets images of npcs for the level
    npcList= ["snakes","hornets","spiders","megaToad"];
    itemNPCPic = loadSprite(npcList, 'N', level);

    % Storing the HP of NPC and damage they deal
    npcHP = [6,3,2,10];
    npcATk = [-5,-2,-2,-8];
    npcType = ["picker", "swarmer", "nester", "boss"];

    % Initializing a list that stores the unique identifier for the NPCs of
    % the level
    npcID = zeros(1,length(npcList));
    for i = 1:length(npcList)
        % Making the ith item in the array the ID of a NPC
        npcID(i)= sum(double(char(npcList(i))));
    end
    for i = 1:length(itemListW)
        % Storing IDs of weapons in the level
        itemWID(i)= sum(double(char(itemListW(i))));
    end
    for i = 1:length(itemListF)
        % Storing IDs of food in the level
        itemFID(i)= sum(double(char(itemListF(i))));
    end
    npcFreq= [5,6,6,1];

    % Defining damage of weapons
    itemWhit = [-4, -2, -3, -8];
    
end

if (level == 2)
    itemListW =["Pan", "Hatchet"];
    itemWPic = loadSprite(itemListW, 'W', level);
    itemListF = ["orange","fish", "potato"];
    itemFPic = loadSprite(itemListF, 'F', level);
    itemFHunger = [33,11,-10; 33,11,5];
    npcList= ["wild dogs","rats","biting Gnats","racoon"];
    npcType = ["swarmer", "picker", "swarmer", "picker"];
    itemNPCPic = loadSprite(npcList, 'N', level);
    npcHP = [6,3,2,20];
    npcATk= [-6,-5,-3,-10];
    npcID = zeros(1,length(npcList));
    for i = 1:length(npcList)
        npcID(i)= sum(double(char(npcList(i))));
    end
    for i = 1:length(itemListW)
        itemWID(i)= sum(double(char(itemListW(i))));
    end
    for i = 1:length(itemListF)
        itemFID(i)= sum(double(char(itemListF(i))));
    end
    npcFreq=[4,4,2,1];
end

if (level == 3)
    itemListW = ["Shovel", "Rake"];
    itemWPic = loadSprite(itemListW, 'W', level);
    itemListF = ["blueberries", "meat"];
    itemFPic = loadSprite(itemListF, 'F', level);
    itemFHunger = [20,-10; 20,-10];
    npcList= ["wolves","mosquito","owl","Bear"];
    npcType = ["picker", "swarmer", "nester", "boss"];
    itemNPCPic = loadSprite(npcList, 'N', level);
    npcHP= [6,3,10,20];
    npcATk= [-7,-3,-5,-15];
    npcID = zeros(1,length(npcList));
    for i = 1:length(npcList)
        npcID(i)= sum(double(char(npcList(i))));
    end
    for i = 1:length(itemListW)
        itemWID(i)= sum(double(char(itemListW(i))));
    end
    for i = 1:length(itemListF)
        itemFID(i)= sum(double(char(itemListF(i))));
    end
    npcFreq= [4,6,3,1];
    
end
% inventory string array that is the same length as the itemlistW " "
for i = 1:length(itemListW)
    % Initializing inventory with empty items that are enough to fit
    % weapons in the level
    inventoryW(i)= " ";
end

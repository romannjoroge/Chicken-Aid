% START GAME

clear
clc
play = questdlg("Do you want to play?",'Chicken Aid', "Yes",...
    "No", "Yes")
switch play
    
    case "Yes"
    player = imread('All_Sprites_PNG\player.png');
    start = msgbox('Chicken lil is lost in the woods. The nearest civilization is 60 miles away. Help him in his journey to saftey!', 'The story!', 'custom',...
        player)
    waitfor(start);
%     Initializing Variables

    % Player HP and hunger, might get rid of this and put information into
    % GameStart
    level = 1;
    PHealthPoint = 100;
    HungerPoint = 100;

    % The number of steps taken at a time, when you take 5 steps at a time
    % you lose HP
    HPtimer = 0

    LevelContent
    GameboardDetails
    
    
    case "No"
        msgbox({'Game over'})
        pause(3)
        close all hidden
end
    

    

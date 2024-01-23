
function [PHealthPoint] = Fightscrn(NPCname, PlayerHP, NPCHP, NPCHit, inventoryW, level,...
    npcList,itemListW, itemWhit, npcHP,npcATk)
%FIGHTSCRN: generates the fight screen the players see

weap = "nothing"; % first choices are to fight of flee
button{1} = ['fight'];
button{2} = ['flee'];
fightscreen = menu(strcat("A ", NPCname," approaches! It has ",...
    num2str(npcHP(npcList==NPCname))," HP and has a hit point of ", num2str(npcATk(npcList==NPCname)),...
    " HP per hit turn. What do you do?"), button{1}, button{2});
if (fightscreen == 1)
    wbutton{1} = ["use hands: -5 HP"];
    for i = 2: length(inventoryW)+1
        if(inventoryW{i-1}~=itemListW{i-1})
            wbutton{i} = [inventoryW{i-1}];
        else
            in = i-1;
            wbutton{i} = [strcat(inventoryW{in}, ": ",num2str(itemWhit(double(in))), " HP")];
        end
    end
    weaponS = menu('Pick a Weapon. PLEASE DO NOT SELECT EMPTY BUTTONS', wbutton);
    if(level == 1) % the switch cases are button for the attack choices
        switch weaponS
            case 1
                weap = "hands";
                PHealthPoint = battle(-5, NPCHit,NPCHP, PlayerHP);
            case 2
                weap = inventoryW{1};
                if(inventoryW{1} == " ")
                    PHealthPoint = battle(-100, NPCHit,NPCHP, PlayerHP);
                else
                    PHealthPoint = battle(-2, NPCHit,NPCHP, PlayerHP);
                end
            case 3
                weap = inventoryW{2};
                if(inventoryW{2} == " ")
                    PHealthPoint = battle(-100, NPCHit,NPCHP, PlayerHP);
                else
                    PHealthPoint = battle(-2, NPCHit,NPCHP, PlayerHP);
                end
            case 4
                weap = inventoryW{3};
                if(inventoryW{3} == " ")
                   PHealthPoint = battle(-100, NPCHit,NPCHP, PlayerHP);
                else
                PHealthPoint = battle(-8, NPCHit,NPCHP, PlayerHP);
                end
            case 5
                weap = inventoryW{4};
                if(inventoryW{4} == " ")
                   PHealthPoint = battle(-100, NPCHit,NPCHP, PlayerHP);
                else
                PHealthPoint = battle(-5, NPCHit,NPCHP, PlayerHP);
                end
        end
    end
end
if( weap == "nothing") % only is applicable if you flee
    PHealthPoint = PlayerHP + randi([-5,0]);
    menu(strcat("You fled. Player HP is: ", num2str(PHealthPoint)), 'OK')
else % otherwise this is displayed:
    menu(strcat("You attacked with ", weap, ". Player HP is: ", num2str(PHealthPoint)), 'OK')
end


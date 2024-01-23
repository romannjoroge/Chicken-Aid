% End Screen for wins and losses

if(sum(double(char(forest.Running))) == sum(double(char('off'))))
   forest.play;
end
[prow, pcol] = find(Mboard==playerID);
if(((level>1 && inventoryW(3) == "keys" )|| PHealthPoint <= 0)&& ed == false)
    if (PHealthPoint <= 0)
        toad = msgbox("Agh! Too bad, poor kid.");
        uiwait(toad);
        w = msgbox("You lost. Lil Chick did not survive his adventure"...
            , "THE END");
        uiwait(w);
    elseif level > 1
        toad = msgbox("Toad: Thanks, kid!", "TOAD");
        uiwait(toad);
        w = msgbox("After giving the Toad his key, Chicken Lil woke up the next morning in the hospital, alive and safe.", "THE END");
        uiwait(w);
    end
    dne = msgbox("Thank you for playing :)", "Thank you");
    uiwait(dne);
    forest.pause
    forest.stop
    close all hidden
    ed = true;
%     gameEnd = questdlg("Do you want to play again?",'Play Again?', "Yes",...
%         "No", "Yes")
%     switch gameEnd
%         case "Yes"
%             GameStart
%         case "No"
            
%     end
end

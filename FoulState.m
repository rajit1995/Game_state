clc
gameState = initFoulState(gameState,flag)

%%
%function initfoulstate = initFoulState(Flag)
function gameState = initFoulState(gameState,flag)
advteam = -1;
for playernum = 1:1:8
    if gameState.players(playernum).lastKick == 1
        if gameState.players(playernum).team == 0
            advteam = 1;             
        else 
            advteam = 0;     
        end 
    end                          
end

    if gameState.state == "ThrowIn"
        if advteam == 0 
            thruplayeridx = randsample([2 4 3], 1)
            if (gameState.ball.position(1) > 0 && gameState.ball.position(1) <=4.5) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)-0.45*cosd(45) gameState.ball.position(2)-0.45*sind(45)]

            elseif (gameState.ball.position(1) > 4.5 && gameState.ball.position(1) <=7.875) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1) gameState.ball.position(2)-0.45*sind(45)]
 
            elseif (gameState.ball.position(1) > 7.875 && gameState.ball.position(1) <9) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)+0.45*cosd(45) gameState.ball.position(2)-0.45*sind(45)]
                
            elseif (gameState.ball.position(1) > 0 && gameState.ball.position(1) <=4.5) && gameState.ball.position(2) >= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)-0.45*cosd(45) gameState.ball.position(2)+0.45*sind(45)]

            elseif (gameState.ball.position(1) > 4.5 && gameState.ball.position(1) <=7.875) && gameState.ball.position(2) >= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1) gameState.ball.position(2)+0.45*sind(45)]
            elseif (gameState.ball.position(1) > 7.875 && gameState.ball.position(1) <9) && gameState.ball.position(2) >= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)+0.45*cosd(45) gameState.ball.position(2)+0.45*sind(45)]
                
            end
     
        elseif advteam == 1 
            thruplayeridx = randsample([5 6 7], 1) 
            if (gameState.ball.position(1) > 0 && gameState.ball.position(1) <=1.125) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)-0.45*cosd(45) gameState.ball.position(2)-0.45*sind(45)]

            elseif(gameState.ball.position(1) > 1.125 && gameState.ball.position(1) <=4.5) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1) gameState.ball.position(2)-0.45*sind(45)]

            elseif (gameState.ball.position(1) > 4.5 && gameState.ball.position(1) <9) && gameState.ball.position(2) <= 0
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)+0.45*cosd(45) gameState.ball.position(2)-0.45*sind(45)]

            
            elseif (gameState.ball.position(1) > 0 && gameState.ball.position(1) <=1.125) && gameState.ball.position(2) <= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)-0.45*cosd(45) gameState.ball.position(2)+0.45*sind(45)]

            elseif (gameState.ball.position(1) > 1.125 && gameState.ball.position(1) <=4.5) && gameState.ball.position(2) <= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1) gameState.ball.position(2)+0.45*sind(45)]

            elseif (gameState.ball.position(1) > 4.5 && gameState.ball.position(1) <9) && gameState.ball.position(2) <= 6
                gameState.players(thruplayeridx).pos = [gameState.ball.position(1)+0.45*cosd(45) gameState.ball.position(2)+0.45*sind(45)]    
            end
        end

   

    %elseif gameState.state == "GoalKick"
     %   advteam = advantage_team(gameState);


    %elseif gameState.state == "KickOff"
     %   advteam = advantage_team(gameState);





    %else gameState.state = "CornerKick"
     %   advteam = advantage_team(gameState);






    end
    
    
end
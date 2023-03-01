gameState = initFoulState(gameState,flag);
%%
function gameState = initFoulState(gameState,flag);
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


    elseif gameState.state == "GoalKick"
        if advteam == 0
            allPositions = zeros(100,100, 2);
            for i = 1:100
                for j = 1:100
                    allPositions(i,j,:) = [i*0.060, j*0.08];
                end
            end
            allPositions = reshape(allPositions, [], 2);
            allPositions((allPositions(:,1) < 2.8 ),:) = [];
            allPositions((allPositions(:,1) > 6.5 ),:) = [];
            allPositions((allPositions(:,2) > 5.8 ),:) = [];
            allPositions((allPositions(:,2) < 0.08 ),:) = [] ;
            shuffledPositions = allPositions(randperm(size(allPositions,1)), :);
            shuffledPositions = shuffledPositions(randperm(size(shuffledPositions,1)), :) ;          
            for i = 1:length(gameState.players)
                if i ~= 1 && i ~= 8
                    gameState.players(i).pos = shuffledPositions(i,:);
                end
            end
            gameState.ball.position = [1.5 3];
            gameState.players(1).pos = [1 3];
            gameState.players(8).pos = [8.5,3];

        elseif advteam==1

            allPositions = zeros(100,100, 2);
            for i = 1:100
                for j = 1:100
                    allPositions(i,j,:) = [i*0.060, j*0.08];
                end
            end
            allPositions = reshape(allPositions, [], 2);
            allPositions((allPositions(:,1) < 2.5 ),:) = [];
            allPositions((allPositions(:,1) > 6.8 ),:) = [];
            allPositions((allPositions(:,2) > 5.8 ),:) = [];
            allPositions((allPositions(:,2) < 0.08 ),:) = [];
            shuffledPositions = allPositions(randperm(size(allPositions,1)), :);
            shuffledPositions = shuffledPositions(randperm(size(shuffledPositions,1)), :);

            for i = 1:length(gameState.players)
                if i ~= 1 && i ~= 8
                    gameState.players(i).pos = shuffledPositions(i,:);
                end
            end
             gameState.ball.position = [7.5 3];
             gameState.players(1).pos = [0.5,3];
             gameState.players(8).pos = [8 3];
             gameState.players(2:7).dir = pi; 

        end
            

    elseif gameState.state == "KickOff"
        if advteam == 0
            gameState.players = getPlayerInit()
            gameState.ball.position = [4.5,3];
            gameState.players(4).pos = [4.5-0.45*cosd(45),3-0.45*sind(45)];


        elseif advteam == 1
            gameState.players = getPlayerInit()
            gameState.ball.position = [4.5,3];
            gameState.players(5).pos = [4.5+0.45*cosd(45),3+0.45*sind(45)];
        end


    %elseif gameState.state = "CornerKick"
        %if c1
        %    gameState.ball.position = [0 0];
        %elseif c2
        %    gameState.ball.position = [0 6];
        %elseif c3
         %   gameState.ball.position = [9 0];
        %elseif c4
        %    gameState.ball.position = [9 6];
        %end







    end
    
    
end

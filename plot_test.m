 figure(gameState.time)
 
    % Title
    title('Robot Soccer Simulation');
    % color the field
    rectangle('Position', [-1 -1 11 8],'LineWidth', 0.125,'FaceColor',"#003518");
    % Draw outer boundary
    rectangle('Position', [0 0 9 6],'LineWidth', 0.125,'EdgeColor','white');
    % Center Line
    rectangle('Position', [0 0 4.5 6],'LineWidth', 0.125,'EdgeColor','white');
    % Center circle
    viscircles([4.5 3],0.75,'Color','white','LineWidth',0.125);
    % Penalty kick position
    viscircles([7.5 3],0.075,'Color','white','LineWidth',0.125);
    viscircles([1.5 3],0.075,'Color','white','LineWidth',0.125);
    % Kickoff position
    viscircles([4.5 3],0.075,'Color','white','LineWidth',0.125);
    % corner circle
    %viscircles([0 0],0.75,'Color','k');
    %viscircles([0 6],0.75,'Color','k');
    %viscircles([9 0],0.75,'Color','k');
    %viscircles([9 6],0.75,'Color','k');
    % the goal area
    rectangle('Position', [0 1.5 1 3],'LineWidth', 0.125,'EdgeColor','white');
    rectangle('Position', [8 1.5 1 3],'LineWidth', 0.125,'EdgeColor','white');
    % the penalty area
    rectangle('Position', [0 0.5 2 5],'LineWidth', 0.125,'EdgeColor','white');
    rectangle('Position', [7 0.5 2 5],'LineWidth', 0.125,'EdgeColor','white');
    % the penalty area
    rectangle('Position', [-0.6 1.7 0.6 2.6],'LineWidth', 0.125,'EdgeColor','white');
    rectangle('Position', [9 1.7 0.6 2.6],'LineWidth', 0.125,'EdgeColor','white');
    % Remove default labels and ticks
   
    % Crop to field dimensions
    axis equal
    xlim([-1 10]);
    ylim([-1 7]);
    hold off


     r = 0.31;
    color = ['r','b'];
    hold on
    for idx = 1:8
        [gameState.players(idx).pos(1)-r, gameState.players(idx).pos(2)-r]
        rectangle('Position',[gameState.players(idx).pos(1)-r, gameState.players(idx).pos(2)-r, 2*r, 2*r],'Curvature', [1,1], 'FaceColor',color(gameState.players(idx).team+1))
    end
    hold off

    r = 0.143;
    hold on
    pos = gameState.ball.position;
    rectangle('Position',[pos(1)-r, pos(2)-r, 2*r, 2*r],'Curvature', [1,1], 'FaceColor','w')
    hold off

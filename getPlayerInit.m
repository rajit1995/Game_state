function player = getPlayerInit()
    %GETPLAYERINIT Summary of this function goes here
    %   Detailed explanation goes here
    player = struct('id', [], ...
               'team', [], ...
               'pos', [], ...
               'vel', [], ...
               'role', [], ...
               'dir', [], ...
               'lastKick', []);
    pos = [0.5,3; ...
           1.9,3; ...
           3.5,4; ...
           3.3,2; ...
           5.7,4; ...
           5.7,2; ...
           7.1,3; ...
           8.5,3];
    role = {0,1,1,2,2,1,1,0};%0:goal keeper, 1: defender, 2:attacker
    for idx=1:8
        player(idx).id = idx;
        player(idx).team = idx>4;
        player(idx).pos = pos(idx,:);
        player(idx).vel = [0,0];
        player(idx).role = role(idx);
        player(idx).dir = (idx>4)*pi;
        player(idx).lastKick = -1;
    end

end


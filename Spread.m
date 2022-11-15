function Score = Spread(PopObj,PF)
% <metric> <min>
% Spread

%------------------------------- Reference --------------------------------
% Y. Wang, L. Wu, and X. Yuan, Multi-objective self-adaptive differential
% evolution with elitist archive and crowding entropy-based diversity
% measure, Soft Computing, 2010, 14(3): 193-209.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group.

    Dis1  = pdist2(PopObj,PopObj);
    Dis1(logical(eye(size(Dis1,1)))) = inf;
    [~,E] = max(PF,[],1);PF(E,:)
    Dis2  = pdist2(PF(E,:),PopObj);
    d1    = sum(min(Dis2,[],2));
    d2    = mean(min(Dis1,[],2));
    Score = (d1+sum(abs(min(Dis1,[],2)-d2))) / (d1+(size(PopObj,1)-size(PopObj,2))*d2);
end
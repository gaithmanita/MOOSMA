function Score = DeltaP(PopObj,PF)
% <metric> <min>
% Averaged Hausdorff distance

%------------------------------- Reference --------------------------------
% O. Schutze, X. Esquivel, A. Lara, and C. A. Coello Coello, Using the
% averaged Hausdorff distance as a performance measure in evolutionary
% multiobjective optimization, IEEE Transactions on Evolutionary
% Computation, 2012, 16(4): 504-522.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group.

    IGDp  = mean(min(pdist2(PF,PopObj),[],2));
    GDp   = mean(min(pdist2(PopObj,PF),[],2));
    Score = max(IGDp,GDp);
end
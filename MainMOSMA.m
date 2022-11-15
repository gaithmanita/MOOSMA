%% Multiple Objective Slime Mould Algorithm (MOSMA)
% M. Premkumar, P. Jangir, R. Sowmya, H. H. Alhelou, A. A. Heidari and H. Chen, 
% "MOSMA: Multi-objective Slime Mould Algorithm Based on Elitist Non-dominated Sorting," 
% in IEEE Access, doi: 10.1109/ACCESS.2020.3047936.
%% Objective Function
% The objective function description contains information about the
% objective function. M is the dimension of the objective space, D is the
% dimension of decision variable space, LB and UB are the
% range for the variables in the decision variable space. User has to
% define the objective functions using the decision variables. Make sure to
% edit the function 'evaluate_objective' to suit your needs.
clc
clear all

for number=1:3
TestProblem=strcat('ZDT',int2str(number));

if number==1
    nVar=30;
N=100;
  True_Pareto(:,1)=linspace(0,1,N)';
  True_Pareto(:,2)=1 -  True_Pareto(:,1).^0.5;
end
if number==2
    nVar=30;
N=100;
  True_Pareto(:,1)=linspace(0,1,N)';
  True_Pareto(:,2)=1 - True_Pareto(:,1).^2;
end

if number==3
    nVar=30;
N=100;
  True_Pareto(:,1)=linspace(0,1,N)';
  True_Pareto(:,2)=1 - True_Pareto(:,1).^0.5 -True_Pareto(:,1).*sin(10*pi*True_Pareto(:,1));
             True_Pareto      = True_Pareto(NDSort(True_Pareto,1)==1,:);
end

if number==4
    nVar=10;
N=100;
  True_Pareto(:,1)=linspace(0,1,N)';
  True_Pareto(:,2)=1 -  True_Pareto(:,1).^0.5;
end

if number==5
    nVar=11;
%N=100;
  True_Pareto(:,1)=1 : 31;
  True_Pareto(:,2)=(nVar-30)./5./True_Pareto(:,1);
end

if number==6
    nVar=10;
N=100;
 minf1  = 0.280775;
            True_Pareto(:,1) = linspace(minf1,1,N)';
            True_Pareto(:,2) = 1 - True_Pareto(:,1).^2;
end

fobj = cec09(TestProblem);

xrange = xboundary(TestProblem, nVar);

% Lower bound and upper bound
LB=xrange(:,1)';
UB=xrange(:,2)';

VarSize=[1 nVar];

D = nVar; % Number of decision variables
M = 2; % Number of objective functions
K=M+D;
% LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
GEN = 200;  % Set the maximum number of generation (GEN)
ecosize = 200;      % Set the population size (NP)
ishow = 10;
%% Start the evolution process
 for run=1:10
Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
%%  Metric Value
 M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
 M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
 M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
 M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
 M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
 M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
 display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
 display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
 display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
 display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
 display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
 display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
 %save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
end
save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 

% for run=1:1
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
% %  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
% %  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
% %  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
% %  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
% %  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
% %  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
% %  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
% %  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
% %  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
% %  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
% %  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
% %  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  %save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end


end


% for number=4:4
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% for i=1:400
%   True_Pareto(i,1)=rand;
%   True_Pareto(i,2)=1-( True_Pareto(i,1)^2);
%   
% end
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 2; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% 
% for number=5:5
% TestProblem=strcat('UF',int2str(number));
% nVar=10;
% for i=1:2*nVar+1    
%   True_Pareto(i,1)=i/2*nVar;
%   True_Pareto(i,2)=1-( i/2*nVar);
%   
% end
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 10; % Number of decision variables
% M = 2; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% 
% for number=6:6
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% for i=1:nVar  
%   True_Pareto(i,1)=2*i-1/2*nVar;
%   True_Pareto(i,2)=1-( True_Pareto(i,1));
%   
% end
% 
% for i=nVar+1:2*nVar 
%   True_Pareto(i,1)=2*i/2*nVar;
%   True_Pareto(i,2)=1-( True_Pareto(i,1));
%   
% end
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 2; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% 
% for number=7:7
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% for i=1:400  
%   True_Pareto(i,1)=rand;
%   True_Pareto(i,2)=1-( True_Pareto(i,1));
%   
% end
% 
% 
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 2; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% for number=8:8
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% i=1;
% while i<=400
%   True_Pareto(i,3)=rand^3;
%   True_Pareto(i,2)=rand^2;
%   if True_Pareto(i,3)+ True_Pareto(i,2)<=1
%   True_Pareto(i,1)=sqrt(1-(True_Pareto(i,3)+ True_Pareto(i,2)));
%   i=i+1;
%   end
% end
% 
% 
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 3; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% for number=10:10
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% i=1;
% while i<=400
%   True_Pareto(i,3)=rand^3;
%   True_Pareto(i,2)=rand^2;
%   if True_Pareto(i,3)+ True_Pareto(i,2)<=1
%   True_Pareto(i,1)=sqrt(1-(True_Pareto(i,3)+ True_Pareto(i,2)));
%   i=i+1;
%   end
% end
% 
% 
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 3; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 
% for number=9:9
% TestProblem=strcat('UF',int2str(number));
% nVar=30;
% 
% for  i=1:400
%   True_Pareto(i,3)=rand;
%   True_Pareto(i,1)=rand*(1-True_Pareto(i,3))*0.25;
%   
%   True_Pareto(i,2)=1-True_Pareto(i,1)-True_Pareto(i,3);
%  
% end
% 
% 
% fobj = cec09(TestProblem);
% 
% xrange = xboundary(TestProblem, nVar);
% 
% % Lower bound and upper bound
% LB=xrange(:,1)';
% UB=xrange(:,2)';
% 
% VarSize=[1 nVar];
% 
% D = 30; % Number of decision variables
% M = 3; % Number of objective functions
% K=M+D;
% % LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
% % UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
% GEN = 200;  % Set the maximum number of generation (GEN)
% ecosize = 200;      % Set the population size (NP)
% ishow = 10;
% %% Start the evolution process
% for run=1:100
% Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
% end
% 
% for run=1:100
% Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
% Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
% Obtained_Pareto=sortrows(Obtained_Pareto,2);
% 
% 
% 
% %%  Metric Value
%  M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
%  M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
%  M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
%  M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
%  M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
%  M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
%  save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
% end
% end
% 


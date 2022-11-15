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

% for number=1:1
% TestProblem=strcat('CF',int2str(number));
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
% for number=2:2
% TestProblem=strcat('CF',int2str(number));
% nVar=10;
% k=0;
% 
%     
%     for j=1:200
%         test=false;
%         while (~test)
%         x=rand;
%         if x<= ((2*1)/(2*2))^2 && x>= (((2*1)-1)/(2*2))^2
%             test=true;
%         end 
%         end
%     
%         
%   True_Pareto(j,1)=x;
%   True_Pareto(j,2)=1-sqrt(x);
%     end
%     for j=1:200
%         test=false;
%         while (~test)
%         x=rand;
%         if x<= ((2*2)/(2*2))^2 && x>= (((2*2)-1)/(2*2))^2
%             test=true;
%         end 
%         end
%     
%         
%   True_Pareto(200+j,1)=x;
%   True_Pareto(200+j,2)=1-sqrt(x);
%     end
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
% for number=3:3
% TestProblem=strcat('CF',int2str(number));
% nVar=10;
% k=0;
% 
%     
%     for j=1:200
%         test=false;
%         while (~test)
%         x=rand;
%         if x<= sqrt(((2*1)/(2*2))) && x>= sqrt((((2*1)-1)/(2*2)))
%             test=true;
%         end 
%         end
%     
%         
%   True_Pareto(j,1)=x;
%   True_Pareto(j,2)=1-(x^2);
%     end
%     for j=1:200
%         test=false;
%         while (~test)
%         x=rand;
%         if x<= sqrt(((2*2)/(2*2)))&& x>= sqrt((((2*2)-1)/(2*2)))
%             test=true;
%         end 
%         end
%     
%         
%   True_Pareto(200+j,1)=x;
%   True_Pareto(200+j,2)=1-(x^2);
%     end
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
% for number=4:5
% TestProblem=strcat('CF',int2str(number));
% nVar=10;
% k=0;
% 
%     
%     for j=1:400
%         
%     x=rand;
%    
%         
%   True_Pareto(j,1)=x;
%   if x<=0.5&&x>=0
%   True_Pareto(j,2)=1-x;
%   else
%       if x<=0.75
%           True_Pareto(j,2)=-0.5*x+0.75;
%       else
%             True_Pareto(j,2)=1-x+0.125;
%       end
%           
%   end
%     end
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


% for number=7:7%6:7
% TestProblem=strcat('CF',int2str(number));
% nVar=10;
% k=0;
% 
%     
%     for j=1:400
%         
%     x=rand;
%    
%         
%   True_Pareto(j,1)=x;
%   if x<=0.5&&x>=0
%   True_Pareto(j,2)=(1-x)^2;
%   else
%       if x<=0.75
%           True_Pareto(j,2)=0.5*(1-x);
%       else
%             True_Pareto(j,2)=0.25*sqrt(1-x);
%       end
%           
%   end
%     end
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


for number=8:8
TestProblem=strcat('CF',int2str(number));
nVar=10;

    
    for j=1:2*2+1
        
    x=rand;
    True_Pareto(j,3)=x;
        y=sqrt((j/2*2)*(1-x^2));
        True_Pareto(j,1)=y;
  True_Pareto(j,2)=sqrt(1-y^2-x^2);
          
    end
    
 True_Pareto=abs(True_Pareto);

fobj = cec09(TestProblem);

xrange = xboundary(TestProblem, nVar);

%Lower bound and upper bound
LB=xrange(:,1)';
UB=xrange(:,2)';

VarSize=[1 nVar];

D = 10; % Number of decision variables
M = 3; % Number of objective functions
K=M+D;
LB = ones(1, D).*0; %  LB - A vector of decimal values which indicate the minimum value for each decision variable.
UB = ones(1, D).*1; % UB - Vector of maximum possible values for decision variables.
GEN = 200;  % Set the maximum number of generation (GEN)
ecosize = 200;      % Set the population size (NP)
ishow = 10;
% Start the evolution process
for run=1:100
Pareto = MOOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
Obtained_Pareto=sortrows(Obtained_Pareto,2);



%%  Metric Value
 M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
 M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
 M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
 M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
 M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
 M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
 save(strcat(strcat('res\MOOSMA',TestProblem),'.mat')); 
end

for run=1:100
Pareto = MOSMA(D,M,LB,UB,ecosize,GEN,ishow,fobj);
Obtained_Pareto= Pareto(:,D+1:D+M); % extract data to plot
Obtained_Pareto=sortrows(Obtained_Pareto,2);



%%  Metric Value
 M_IGD(1,run)=IGD(Obtained_Pareto,True_Pareto);
 M_GD(1,run)=GD(Obtained_Pareto,True_Pareto);
 M_HV(1,run)=HV(Obtained_Pareto,True_Pareto);
 M_Spacing(1,run)=Spacing(Obtained_Pareto,True_Pareto);
 M_Spread(1,run)=Spread(Obtained_Pareto,True_Pareto);
 M_DeltaP(1,run)=DeltaP(Obtained_Pareto,True_Pareto);
%  display(['The IGD Metric obtained by MOSMA is     : ', num2str(M_IGD(1,run))]);
%  display(['The GD Metric obtained by MOSMA is      : ', num2str(M_GD(1,run))]);
%  display(['The HV Metric obtained by MOSMA is      : ', num2str(M_HV(1,run))]);
%  display(['The Spacing Metric obtained by MOSMA is : ', num2str(M_Spacing(1,run))]);
%  display(['The Spread Metric obtained by MOSMA is  : ', num2str(M_Spread(1,run))]);
%  display(['The DeltaP Metric obtained by MOSMA is  : ', num2str(M_DeltaP(1,run))]);
 save(strcat(strcat('res\MOSMA',TestProblem),'.mat')); 
end
 end


% for number=9:10
% TestProblem=strcat('CF',int2str(number));
% nVar=10;
% for j=101:400
% True_Pareto(j,1)=0;
% x=rand;
% True_Pareto(j,2)=x;
% True_Pareto(j,3)=sqrt(1-x^2);
% end
%     
%     for j=1:100
%       
%         x=rand;
%         True_Pareto(j,3)=x;
%         test=false;
%        y= rand*(sqrt((((2*j))/2*2)*(1-x^2))-sqrt((((2*j)-1)/2*2)*(1-x^2)))+sqrt((((2*j)-1)/2*2)*(1-x^2));
%        
% %         while ~test
% %             y=rand;
% %             if y>=sqrt((((2*j)-1)/2*2)*(1-x^2))&& y<=sqrt((((2*j))/2*2)*(1-x^2))
% %                 test=true;
% %             end
% %         end
% True_Pareto(j,1)=y;
% True_Pareto(j,2)=sqrt(1-y^2-x^2);
%         
%     end
%         
%    True_Pareto=abs(True_Pareto);
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
% D = 10; % Number of decision variables
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
% 
% 

% M. Premkumar, P. Jangir, R. Sowmya, H. H. Alhelou, A. A. Heidari and H. Chen, 
% "MOSMA: Multi-objective Slime Mould Algorithm Based on Elitist Non-dominated Sorting," 
% in IEEE Access, doi: 10.1109/ACCESS.2020.3047936.
function f = MOSMA(dim,M,lb,ub,N,Max_iter,ishow,evaluate_objective)          
X = zeros(N,dim);
Sol = zeros(N,dim);
weight = ones(N,dim);%fitness weight of each slime mold
%% Initialize the population
for i=1:N
   x(i,:)=lb+(ub-lb).*rand(1,dim);
  
   f(i,1:M) = evaluate_objective(x(i,:)')';
end
new_Sol=[x f]; 
new_Sol = solutions_sorting(new_Sol, M, dim);
for i = 1 : Max_iter 
[SmellOrder,SmellIndex] = sort(Sol);  
worstFitness = SmellOrder(N);
bestFitness = SmellOrder(1);
S=bestFitness-worstFitness+eps;  % plus eps to avoid denominator zero
        for k=1:N
            if k<=(N/2)  
                weight(SmellIndex(k),:) = 1+rand()*log10((bestFitness-SmellOrder(k))/(S)+1);
            else
                weight(SmellIndex(k),:) = 1-rand()*log10((bestFitness-SmellOrder(k))/(S)+1);
            end
        end     
a = atanh(-(i/Max_iter)+1);   
b = 1-i/Max_iter;
    for j=1:N 
        best=(new_Sol(j,1:dim) - new_Sol(1,(1:dim)));
        if rand<0.03    
            X(j,:) = (ub-lb).*rand+lb;
        else
            p =tanh(abs(f(j)-best));  
            vb = unifrnd(-a,a,1,dim); 
            vc = unifrnd(-b,b,1,dim);        
                r = rand();
                A = randi([1,N]);  
                B = randi([1,N]);
                if r<p    
                    X(j,:) = best+ vb.*(weight(j,:).*X(A,:)-X(B,:));
                else
                    X(j,:) = best+ vc.*(weight(j,:).*X(A,:)-X(B,:));
                end  
        end
        Sol(j,1:dim) = X(j,1:dim);       
        Flag4ub=Sol(j,1:dim)>ub;
        Flag4lb=Sol(j,1:dim)<lb;
        Sol(j,1:dim)=(Sol(j,1:dim).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;  
        %% Evalute the fitness/function values of the new population
        Sol(j, dim+1:M+dim) = evaluate_objective(Sol(j,1:dim)')';
        if Sol(j,dim+1:dim+M) <= new_Sol(1,(dim+1:dim+M)) 
           new_Sol(1,1:(dim+M)) = Sol(j,1:(dim+M));  
        end
    end    
%% ! Very important to combine old and new bats !
   Sort_bats(1:N,:) = new_Sol;
   Sort_bats((N + 1):(2*N), 1:M+dim) = Sol;
%% Non-dominated sorting process (a separate function/subroutine)
   Sorted_bats = solutions_sorting(Sort_bats, M, dim); 
%% Select npop solutions among a combined population of 2*npop solutions  
    new_Sol = cleanup_batspop(Sorted_bats, M, dim, N);  
    if rem(i, ishow) == 0
    fprintf('Generation: %d\n', i);        
    end
end
f=new_Sol;
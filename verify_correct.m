function [Sol]=verify_correct(Sol,Dim,Lb,Ub)



for i=1:3:Dim
    
    Sol(1,i)=round(Sol(1,i));
    
    if Sol(1,i)>1
        Sol(1,i)=1;
    else
       if Sol(1,i)<-1
           Sol=-1;
       end
    end
    
    if i~=1
            
            ub=Ub(1,(i+2)/3);
            lb=Lb(1,(i+2)/3);
            
            
    else
            ub=Ub(1,i);
            lb=Lb(1,i);
            
            
    end
    
    if Sol(1,i+1)>ub||Sol(1,i+1)<lb
        
        Sol(1,i+1)= lb+rand*(ub-lb);
        
    end
    
    if  Sol(1,i+2)>ub||Sol(1,i+2)<Sol(1,i+1)
        
         Sol(1,i+2)= Sol(1,i+1)+rand*(ub-Sol(1,i+1));
        
    end
    
    
    
    
    
    
    
end




end
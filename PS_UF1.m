function PS=PS_UF1(n)

PS=zeros(400,n);
for i=1:400
    
    x1=rand;
    PS(i,1)=x1;
    for j=2:n
   PS(i,j)=sin(6*pi*x1+((j*pi)/n));
    end
end


end

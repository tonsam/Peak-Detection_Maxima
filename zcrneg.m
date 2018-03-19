function [loc,zcr]=zcrneg(y)
L=length(y);
zcr=0;  
for i=1:L-1
    if((y(i)*y(i+1)<0)&&(y(i+1)>0))
        zcr=zcr+1;
        loc(zcr)=i;
    end 
end
    
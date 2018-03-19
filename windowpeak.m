function loc= windowpeak(x)
l=length(x);
loc=1;
max=0;
for i=1:l
    if(x(i)>max)
        max=x(i);
        loc=i;
    end
end
end
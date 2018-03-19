function forward_diff=forward_diff(z1)
L=length(z1);
h=1;
for i=1:L-1                %forward difference
    forward_diff(i)=(z1(i+h)-z1(i))/h;
end
end

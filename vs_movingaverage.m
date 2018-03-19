function res=vs_movingaverage(x,m,n)
%------x is given input signal for moving average----------
%------m----no of samples to average for frame-------------
%------n----no of samples to overalpped with next frame----
%----res is output of moving average-------
x1=buffer(x,m,n);
for i=1:size(x1,2)
   x2=x1(:,i);
   x3(i)=sum(x2)/m;
end
res=x3;


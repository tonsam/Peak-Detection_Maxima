clc;
close all;
clear all;
load('1fs250.mat');
fs=250;
k=2;    % 2 for ppg 
t=100;%signal number    
time=20;
win=200;
for i=1:4
    z(i,:)=val(i,1:fs*time);
    result=vs_movingaverage(z(i,:),win,win-1);
    z_clean(i,:)=z(i,:)-result;
    z_clean(i,:)=normalize(z_clean(i,:));
end
win=10;
z1=z_clean(k,:);
subplot(3,1,1);
plot(z1);
ylabel('clean sig');
forward_diff=vs_movingaverage(forward_diff(z1),win,win-1);
forward_diff=vs_movingaverage(forward_diff,win,win-1);
subplot(3,1,2);
[ploc,locs]=zcrpos(forward_diff);
plot(forward_diff); hold on;
scatter(ploc,forward_diff(ploc),'*r');
ylabel('for diff');

%actual
lsig=length(z1);
L=length(ploc)
newloc=[];
newloc=ploc;

start=1;
endpoint=ploc(L);
for i=1:L
    
    start=ploc(i)-t;
    endpoint=ploc(i)+t;
    if(start<1)
        start=1;
    end
    if(endpoint>ploc(L))
        endpoint=ploc(L);
    end
    x=z1(start:endpoint);
    
    newloc(i)=start+windowpeak(x);
end
j=1;
finalloc=[];
finalloc(1)=newloc(1);
for i=1:length(newloc)
    if(finalloc(j)~=newloc(i))
    finalloc(j+1)=newloc(i);
    j=j+1;
    end
end
subplot(3,1,3);
plot(z1); hold on;
scatter(finalloc,z1(finalloc),'*r');
ylabel('clean sig');
wavenum=length(finalloc);



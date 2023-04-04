clc;
close all;
clear all;
t=-1:0.01:1;
len=length(t);
y=-2:0.01:2;
leny=length(y);
for i=1:len
    if t(i)<0
        x(i)=t(i)+1;
        h(i)=1;
    elseif t(i)>=0
            x(i)=-t(i)+1;
            h(i)=1;
    if t(i)==-1
        h(i)=0;
    if t(i)==1
        h(i)=0;
    end
    end
    end
    end
end
m=length(x);
n=length(h);
X=[x zeros(1,m)];
H=[h zeros(1,n)];
for i=1:m+n-1
    Y(i)=0;
    for j=1:i
        Y(i)=Y(i)+X(j)*H(i-j+1);
    end
end
Z=conv(x,h);
subplot(411);
plot(t,x);
subplot(412);
plot(x,h);
subplot(413);
plot(Y);
subplot(414);
plot(Z);

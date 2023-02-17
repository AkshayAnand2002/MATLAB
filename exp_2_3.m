clc
clear all
close all
x=[1 2 3 4];
h=[5 6];
n=length(x);
m=length(h);
if (m>n)
    x=[x zeros(1,m-n)];
elseif (n>m)
    h=[h zeros(1,n-m)];
end
n=length(x);
m=length(h);
x=[x zeros(1,n)];
h=[h zeros(1,m)];
a=m+n-1;
temp=h;
for i=1:a
    y(i)=0;
    for j=1:i
        y(i)=y(i)+x(i-j+1)*h(j);
    end
end
h=fliplr(h);
y1=xcorr(x,h);
subplot(411);
stem(x);
xlabel("time");
ylabel("x");
title("21ucc015");
subplot(412);
stem(temp);
xlabel("time");
ylabel("temp");
subplot(413);
stem(y);
xlabel("time");
ylabel("y");
subplot(414);
stem(y1);
xlabel("time");
ylabel("Actual Correlation");
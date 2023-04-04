clc;
close all;
clear all;
x=[5 6 7 8];
h=[1 2 3];
m=length(x);
n=length(h);
X=[x zeros(1,m)];
H=[h zeros(1,n)];
Z=[zeros(1,m+n-1)];
len=m+n-1;
for i=1:len
    Z(i)=0;
    for j=(1:i)
        Z(i)=Z(i)+X(j)*H(i-j+1);
    end
end
subplot(411);
stem(x);
subplot(412);
stem(h);
subplot(413);
stem(Z);
subplot(414);
a=conv(x,h);
stem(a);

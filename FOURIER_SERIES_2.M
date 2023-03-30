clc;
close all;
clear all;
syms t;
x=exp(-t)+exp(t);
w=2*pi/6;
X=0;
for n=-10:10
    cn=int(x*exp(-j*w*n*t),t,-3,3)/6;
    c(n+11)=cn;
    X=X+cn*exp(j*w*n*t);
end
ezplot(x,[-3,3]);
hold on
ezplot(X,[-3,3]);
title("21UCC015");
figure
subplot(211);
stem(abs(c));
title("21UCC015");
subplot(212);
stem(angle(c));
title("21UCC015");

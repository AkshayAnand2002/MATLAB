% FOURIER SERIES
% t+exp(-t) from 0 TO 3
clc;
close all;
clear all;
syms t;
x=t+exp(-t);
w=2*pi/3;
X=0;
for n=-10:10
    cn=int(x*exp(-j*n*w*t),t,0,3)/3;
    c(n+11)=cn;
    X=X+cn*exp(j*n*w*t);
end
ezplot(x,[0,3]);
hold on
ezplot(X,[0,3]);
title("21UCC015");
figure
subplot(211);
stem(abs(c));
title("21UCC015");
subplot(212);
stem(angle(c));
title("21UCC015");

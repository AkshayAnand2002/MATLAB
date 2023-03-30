clc;
close all;
clear all;
syms t;
x=t+exp(-t);
w=2*pi/3;
X=0;
for n=-10:10
    cosn=cos(n*w*t);
    sinn=sin(n*w*t);
    an=int(x*cosn,t,0,3)/3;
    bn=int(x*sinn,t,0,3)/3;
    X=X+an*cosn+bn*sinn;
end
ezplot(x,[0,3]);
hold on
ezplot(X,[0,3]);
title("21UCC015");

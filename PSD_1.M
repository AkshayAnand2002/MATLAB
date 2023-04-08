clc
close all
clear all
dt=0.001;
t=0:dt:1;
n=length(t);
l=1:floor(n/2);
x=sin(2*pi*50*t)+sin(2*pi*150*t);
fr=(1/(dt*n))*[0:n];
f=fft(x,n);
fa=abs(f);
psd=(abs(f).^2)/n;
subplot(311);
plot(t,x);
title("21ucc015-time domain");
subplot(312);
plot(fr(l),fa(l));
title("21ucc015-frequency domain");
subplot(313);
plot(fr(l),psd(l));
title("21ucc015-PSD");

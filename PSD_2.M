clc
close all
clear all
dt=0.001;
t=0:dt:1;
n=length(t);
l=1:floor(n/2);
s=sin(2*pi*50*t);
noise=3*randn(1,n);
fr=(1/(dt*n))*[0:n];
x=s+noise;
f=fft(x,n);
fa=abs(f);
psd=(abs(f).^2)/n;
r=psd>0.4*max(psd); % to remove noise.
psdnew=r.*psd;
fnew=r.*f;
xnew=ifft(fnew);
subplot(411);
plot(t,s);
title("21ucc015-time domain");
subplot(412);
plot(fr(l),psd(l));
title("21ucc015-noise");
subplot(413);
plot(fr(l),psdnew(l));
title("21ucc015-without noise");
subplot(414);
plot(t,xnew);
title("21ucc015-denoised");

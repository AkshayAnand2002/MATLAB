t=1:0.01:100;
x=randi([-1,1],1,100);
len1=length(x);
y=randn(1,100);
for i=1:len1
    if x(i)<0
        x(i)=-1;
    elseif x(i)>0
        x(i)=1;
    end
end
len2=length(y);
for i=1:len2
    if y(i)<0
        y(i)=-1;
    elseif y(i)>0
        y(i)=1;
    end
end
subplot(211);
stem(x);
title("21ucc015-uniform");
subplot(212);
stem(y);
title("21ucc015-normal");
t=0:0.001:12;
len=length(t);
x=zeros(0,13);
for i=1:len
    if t(i)<=2
        x(i)=10;
    elseif 2<t(i) && t(i)<=7
        x(i)=12-t(i);
    elseif t(i)>=7 && t(i)<=12
        x(i)=t(i)-2;
    end
end
plot(t,x);
xlabel("x");
ylabel("y");
title("21ucc015");
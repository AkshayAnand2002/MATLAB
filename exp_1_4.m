t=0:0.001:8;
len=length(t);
odd=0;
for i=1:2:len
    odd=odd+(sin(i*t)/i);
end
even=0;
for i=2:2:len
    even=even+(sin(i*t)/i);
end
sum=odd+even;
subplot(311);
plot(t,odd);
xlabel("x");
ylabel("odd");
title("21ucc015");
subplot(312);
plot(t,even);
xlabel("x");
ylabel("even");
title("21ucc015");
subplot(313);
plot(t,sum);
xlabel("x");
ylabel("sum");
title("21ucc015");
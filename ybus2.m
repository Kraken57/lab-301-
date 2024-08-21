clc;
clear all;
data = [
    1 2 0.05+0.15i;
    1 3 0.10+0.30i;
    2 3 0.15+.45i;
    2 4 0.1+0.3i;
    3 4 0.05+.15i];

maxBuses = 0;
for i=1 : length(data)
    from = real(data(i,1));
    to = real(data(i,1));
    maxBuses = max(maxBuses, from);
    maxBuses = max(maxBuses, to);
end

ybus = zeros(maxBuses, maxBuses);
a = 1.04; %alpha 
for i=1 : length(data)
    from = real(data(i,1));
    to = real(data(i, 2));
    Y = 1/data(i,3);
    if(from==3 || to == 4)
        a =1.04;
    else 
        a = 1;
    end
    ybus(from,to) =  ybus(from,to) - (a*Y);
    ybus(to,from) =  ybus(to,from) - (a*Y);
    ybus(from,from) =  ybus(from,from) + a*Y + ((a-1)*a*Y) + (1-a)*a*Y;
    ybus(to,to) =  ybus(to,to) + a*Y + ((a-1)*a*Y) + (1-a)*a*Y;
end
ybus

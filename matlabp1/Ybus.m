clc;
clear all;
T = readtable("Book1.xlsx");
Z = sqrt((T.R).^2 + (T.X).^2);
magZ = (Z).^-1;

Y = complex(T.R, T.X).^-1;
a= max(max(T.from), max(T.to));
ybus = zeros(a,a)

from = T.from;
to = T.to;
for i=1 : height(T)
    ybus(from(i),to(i)) =  ybus(from(i),to(i)) - Y(i);
    ybus(to(i),from(i)) =  ybus(to(i),from(i)) - Y(i);
    ybus(from(i),from(i)) =  ybus(from(i),from(i)) + Y(i);
    ybus(to(i),to(i)) =  ybus(to(i),to(i)) + Y(i);
end
disp(ybus)
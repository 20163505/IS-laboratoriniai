clear all;
clc;
x = linspace (0.1,1,20);
n_w = 0.01;
d = base_function(x);


r=zeros(1, 3);
r(1)=0.1;
r(2)=0.19;
r(3)=0.12;
%w = (-1 + (1+1).*randn(1,3))*0.01;
%b = (-1 + (1+1).*randn(1,1))*0.01;

w=randn(1,3)*0.01;
b=randn(1,1)*0.1;

y = zeros(1, length(x));
e = zeros(1, length(x));

y=base_function(x);
MAX = islocalmax(y);
MIN = islocalmin(y);
cmax = x(MAX);
cmin = x(MIN);


e_all =1000;
while e_all~=0
    for i=1:length(x)
        y(i)= gaussian_function(x(i), cmax(1), r(1))*w(1)+gaussian_function(x(i),cmin,r(3))*w(3)+gaussian_function(x(i),cmax(2),r(2))*w(2)+b;
        e(i)= d(i)-y(i);
        w(1)= w(1)+n_w*e(i)*gaussian_function(x(i),cmax(1),r(1));
        w(3)= w(3)+n_w*e(i)*gaussian_function(x(i),cmin,r(3));
        w(2)= w(2)+n_w*e(i)*gaussian_function(x(i),cmax(2),r(2));
        b= b + n_w*e(i);
    end
    e_all = e_all - 1;
end
y_final = gaussian_function(x, cmax(1), r(1))*w(1)+gaussian_function(x,cmin,r(3))*w(3)+gaussian_function(x(i),cmax(2),r(2))*w(2)+b;

plot(x,d,'b',x,y_final,'*');
grid on

function F=gaussian_function(x,c,r)
    F=exp(-(x-c).^2/(2*r^2));
end
function y=base_function(x)
    y=(1+0.6.*sin(2.*pi.*x/0.7)+0.3.*sin(2.*pi.*x))/2;
end

clear all;
clc;
%2 lab.
x=0.1:1/50:1;
d=(1+0.6*sin(2*pi*x/0.7))+0.3*sin(2*pi*x)/2;
plot (x,d); grid on;
hold on;

%1 sluoksnis
w11=randn(1);
w21=randn(1);
w31=randn(1);
w41=randn(1);
w51=randn(1);

%2 sluoksnis
w12=randn(1);
w22=randn(1);
w32=randn(1);
w42=randn(1);
w52=randn(1);


b=randn(1);
b1=randn(1);
b2=randn(1);
b3=randn(1);
b4=randn(1);
b5=randn(1);

y=zeros(1,46);

e_all =8000;
while e_all~=0
for index=1:46
%isejimai
v11=w11*x(index)+b1;
y11=1/(1+exp(-v11));

v21=w21*x(index)+b2;
y21=1/(1+exp(-v21));

v31=w31*x(index)+b3;
y31=1/(1+exp(-v31));

v41=w41*x(index)+b4;
y41=1/(1+exp(-v41));

v51=w51*x(index)+b5;
y51=1/(1+exp(-v51));

y(index)=y11*w12+y21*w22+y31*w32+y41*w42+y51*w52+b;
%klaidos skaiciavimas
e(index)=d(index)-y(index);

%atnaujinimas
eta=0.15;
w12=w12+eta*e(index)*y11;
w22=w22+eta*e(index)*y21;
w32=w32+eta*e(index)*y31;
w42=w42+eta*e(index)*y41;
w52=w52+eta*e(index)*y51;
b=b+eta*e(index)*1;

delta1=y11*(1-y11)*e(index)*w12;
delta2=y21*(1-y21)*e(index)*w22;
delta3=y31*(1-y31)*e(index)*w32;
delta4=y41*(1-y41)*e(index)*w42;
delta5=y51*(1-y51)*e(index)*w52;

w11=w11*eta*delta1*x(index);
w21=w21*eta*delta2*x(index);
w31=w31*eta*delta3*x(index);
w41=w41*eta*delta4*x(index);
w51=w51*eta*delta5*x(index);

b1=b1+eta*delta1;
b2=b2+eta*delta2;
b3=b3+eta*delta3;
b4=b4+eta*delta4;
b5=b5+eta*delta5;


v11=w11*x(index)+b1;
y11=1/(1+exp(-v11));

v21=w21*x(index)+b2;
y21=1/(1+exp(-v21));

v31=w31*x(index)+b3;
y31=1/(1+exp(-v31));

v41=w41*x(index)+b4;
y41=1/(1+exp(-v41));

v51=w51*x(index)+b5;
y51=1/(1+exp(-v51));

yf(index)=y11*w12+y21*w22+y31*w32+y41*w42+y51*w52+b;

end
e_all = e_all - 1;
end




plot(x,yf,'*')








function [t1,t2,t3]=inv3arm(x,y,z)
%3DOF arm inverse kinemtics

d1=100; a2=67; a3=120;

t1=atan2(y,x);
t3=acos((x.^2+y.^2+(z-d1).^2-(a2.^2+a3.^2))/(2*a2*a3));

c1=cos(t1);
c3=cos(t3);
s1=sin(t1);
s3=sin(t3);

m1=a2+a3*c3;
m2=a3*s3;
t2=asin((z-d1)/(m1.^2+m2.^2).^0.5)-atan(m2/m1);

%c2=cos(t2);
%s2=sin(t2);
%c23=cos(t2+t3);
%s23=sin(t2+t3);

t1=rad2deg(t1)
t2=rad2deg(t2);
t3=rad2deg(t3)
t2=t2-90

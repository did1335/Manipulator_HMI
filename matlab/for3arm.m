function [x,y,z]=for3arm(t1,t2,t3)
%3DOF arm forward kinemtics

t2=t2+90; 
d1=100; a2=67; a3=120;
%theta in degree
t1=deg2rad(t1);
t2=deg2rad(t2);
t3=deg2rad(t3);
c1=cos(t1);
c2=cos(t2);
s1=sin(t1);
s2=sin(t2);
c23=cos(t2+t3);
s23=sin(t2+t3);
x=c1*(a3*c23+a2*c2)
y=s1*(a3*c23+a2*c2)
z=d1+a2*s2+a3*s23

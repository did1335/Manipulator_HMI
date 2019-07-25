function R=linspace3d(A,B,n)
R=zeros(n,3);
for i=1:3
    R(:,i)=linspace(A(i),B(i),n);
end
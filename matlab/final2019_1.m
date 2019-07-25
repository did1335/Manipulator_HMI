A=[101 21 220]; B=[21 -61 150]; C=[150,30,200];
X=[A;B];
R1=[];
n=size(X,1);
for i=1:n-1
    y=linspace3d(X(i,:),X(i+1,:),21);
    if (i~=1)
        y=y(2:end,:);
    end
    R1=[R1;y];
end
R1=[R1 zeros(size(R1,1),3)];
x=R1(:,1); y=R1(:,2); z=R1(:,3);
[theta1,theta2,theta3]=inv3arm(x,y,z);
R1(:,4)=theta1; R1(:,5)=theta2(:,1); R1(:,6)=theta3;
%fprintf('R=\n');
%disp(R1);
plot3(x,y,z);
hold on;

Y=[B;C];
R2=[];
n=size(Y,1);
for i=1:n-1
    y=linspace3d(Y(i,:),Y(i+1,:),21);
    if (i~=1)
        y=y(2:end,:);
    end
    R2=[R2;y];
end
R2=[R2 zeros(size(R2,1),3)];
x=R2(:,1); y=R2(:,2); z=R2(:,3);
[theta1,theta2,theta3]=inv3arm(x,y,z);
R2(:,4)=theta1; R2(:,5)=theta2(:,21); R2(:,6)=theta3;
%fprintf('R2=\n');
%disp(R2);
plot3(x,y,z);

R=[];
R=[R1;R2];
fprintf('R=\n');
disp(R);
xlswrite('testdata.xlsx',R);
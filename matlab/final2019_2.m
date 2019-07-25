A=[101 21 220]; B=[21 -61 150];
[theta1i,theta2i,theta3i]=inv3arm(A(1),A(2),A(3));
thetai=[theta1i,theta2i,theta3i];
[theta1f,theta2f,theta3f]=inv3arm(B(1),B(2),B(3));
thetaf=[theta1f,theta2f,theta3f];

ti=0; tf=2; tb=0.5;
w=(thetaf-thetai)/(tf-tb);
t=ti:0.1:tf;

for i=1:length(t)
    if (t(i)>=0 & t(i)<=tb)
        thetaA(i,:)=thetai+0.5*w/tb*t(i)^2;
        velA(i,:)=w*t(i)/tb;
        accA(i,:)=w/tb;
    elseif (t(i)>tb & t(i)<=tf-tb)
        thetaA(i,:)=thetai+0.5*w*tb+w*(t(i)-tb);
        velA(i,:)=w;
        accA(i,:)=0;
    else
        thetaA(i,:)=thetaf-0.5*w*(tf-t(i))^2;
        velA(i,:)=w/tb*(tf-t(i));
        accA(i,:)=-w/tb;
    end
end

Px=[]; Py=[]; Pz=[];
for i=1:size(thetaA,1)
    [x,y,z]=for3arm(thetaA(i,1),thetaA(i,2),thetaA(i,3));
    Px=[Px; x]; Py=[Py; y]; Pz=[Pz; z];
end

subplot(3,3,1),plot(t,thetaA); title('theta A-B'); legend('theta1','theta2','theta3');
subplot(3,3,4),plot(t,velA); title('velocity A-B'); legend('theta1','theta2','theta3');
subplot(3,3,7),plot(t,accA); title('acceleration A-B'); legend('theta1','theta2','theta3');
subplot(3,3,3),plot3(Px,Py,Pz); title('A-B');


B=[21 -61 150]; C=[150 30 200];
[theta1i,theta2i,theta3i]=inv3arm(B(1),B(2),B(3));
thetai=[theta1i,theta2i,theta3i];
[theta1f,theta2f,theta3f]=inv3arm(C(1),C(2),C(3));
thetaf=[theta1f,theta2f,theta3f];

ti=0; tf=2; tb=0.5;
w=(thetaf-thetai)/(tf-tb);
t=ti:0.1:tf;

for i=1:length(t)
    if (t(i)>=0 & t(i)<=tb)
        thetaB(i,:)=thetai+0.5*w/tb*t(i)^2;
        velB(i,:)=w*t(i)/tb;
        accB(i,:)=w/tb;
    elseif (t(i)>tb & t(i)<=tf-tb)
        thetaB(i,:)=thetai+0.5*w*tb+w*(t(i)-tb);
        velB(i,:)=w;
        accB(i,:)=0;
    else
        thetaB(i,:)=thetaf-0.5*w*(tf-t(i))^2;
        velB(i,:)=w/tb*(tf-t(i));
        accB(i,:)=-w/tb;
    end
end

Px=[]; Py=[]; Pz=[];
for i=1:size(thetaB,1)
    [x,y,z]=for3arm(thetaB(i,1),thetaB(i,2),thetaB(i,3));
    Px=[Px; x]; Py=[Py; y]; Pz=[Pz; z];
end
subplot(3,3,2),plot(t,thetaB); title('theta B-C'); legend('theta1','theta2','theta3');
subplot(3,3,5),plot(t,velB); title('velocity B-C'); legend('theta1','theta2','theta3');
subplot(3,3,8),plot(t,accB); title('acceleration B-C'); legend('theta1','theta2','theta3');
subplot(3,3,6),plot3(Px,Py,Pz); title('B-C');

fprintf('thetaA=\n');
disp(thetaA);
fprintf('thetaB=\n');
disp(thetaB);

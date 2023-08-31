V = [1.05; 1; 1; 1.04];
delta = zeros(4,1);

YBUS = [ 23-j*46  -5+j*10    -8+j*16   -10+j*20
       -5+j*10  30-j*60    -10+j*30  -15+j*20
       -8+j*16  -10+j*30   23-j*61   -5+j*15
       -10+j*20 -15+j*20   -5+j*15   30-j*55];

SY= abs(YBUS); 
YT = angle(YBUS);
Ps=[-6; -5; 1];
Qs=[-3; -2];

%%%yekbar tekrar


P=[V(2)*V(1)*SY(2,1)*cos(YT(2,1)-delta(2)+delta(1))+V(2)^2*SY(2,2)*cos(YT(2,2))+ ...
   V(2)*V(3)*SY(2,3)*cos(YT(2,3)-delta(2)+delta(3))+V(2)*V(4)*SY(2,4)*cos(YT(2,4)-delta(2)+delta(4));
   V(3)*V(1)*SY(3,1)*cos(YT(3,1)-delta(3)+delta(1))+V(3)^2*SY(3,3)*cos(YT(3,3))+ ...
   V(3)*V(2)*SY(3,2)*cos(YT(3,2)-delta(3)+delta(2))+V(3)*V(4)*SY(3,4)*cos(YT(3,4)-delta(3)+delta(4));
   V(4)*V(1)*SY(4,1)*cos(YT(4,1)-delta(4)+delta(1))+V(4)^2*SY(4,4)*cos(YT(4,4))+ ...
   V(4)*V(2)*SY(4,2)*cos(YT(4,2)-delta(4)+delta(2))+V(4)*V(3)*SY(4,3)*cos(YT(4,3)-delta(4)+delta(3))];

Q= [-V(2)*V(1)*SY(2,1)*sin(YT(2,1)-delta(2)+delta(1))-V(2)^2*SY(2,2)*sin(YT(2,2))- ...
    V(2)*V(3)*SY(2,3)*sin(YT(2,3)-delta(2)+delta(3))-V(2)*V(4)*SY(2,4)*sin(YT(2,4)-delta(2)+delta(4));
   -V(3)*V(1)*SY(3,1)*sin(YT(3,1)-delta(3)+delta(1))-V(3)^2*SY(3,3)*sin(YT(3,3))- ...
    V(3)*V(2)*SY(3,2)*sin(YT(3,2)-delta(3)+delta(2))-V(3)*V(4)*SY(3,4)*sin(YT(3,4)-delta(3)+delta(4))];

%%%J
J(1,1)=V(2)*V(1)*SY(2,1)*sin(YT(2,1)-delta(2)+delta(1))+...
       V(2)*V(3)*SY(2,3)*sin(YT(2,3)-delta(2)+delta(3))+V(2)*V(4)*SY(2,4)*sin(YT(2,4)-delta(2)+delta(4));
J(1,2)=-V(2)*V(3)*SY(2,3)*sin(YT(2,3)-delta(2)+delta(3));
J(1,2)
J(1,3)=-V(2)*V(4)*SY(2,4)*sin(YT(2,4)-delta(2)+delta(4));
J(1,4)=V(1)*SY(2,1)*cos(YT(2,1)-delta(2)+delta(1))+ ...
       V(3)*SY(2,3)*cos(YT(2,3)-delta(2)+delta(3))+V(4)*SY(2,4)*cos(YT(2,4)-delta(2)+delta(4))+ ...
       V(2)*SY(2,2)*2*cos(YT(2,2));
J(1,5)=V(2)*SY(2,3)*cos(YT(2,3)-delta(2)+delta(3));

J(2,1)=-V(3)*V(2)*SY(3,2)*sin(YT(3,2)-delta(3)+delta(2));
J(2,2)=V(3)*V(1)*SY(3,1)*sin(YT(3,1)-delta(3)+delta(1))+...
       V(3)*V(2)*SY(3,2)*sin(YT(3,2)-delta(3)+delta(2))+V(3)*V(4)*SY(3,4)*sin(YT(3,4)-delta(3)+delta(4));
J(2,3)=-V(3)*V(4)*SY(3,4)*sin(YT(3,4)-delta(3)+delta(4));
J(2,4)= V(3)*SY(3,2)*cos(YT(3,2)-delta(3)+delta(2));
J(2,5)=V(1)*SY(3,1)*cos(YT(3,1)-delta(3)+delta(1))+ ...
       V(2)*SY(3,2)*cos(YT(3,2)-delta(3)+delta(2))+V(4)*SY(3,4)*cos(YT(3,4)-delta(3)+delta(4))+...
       V(3)*2*SY(3,3)*cos(YT(3,3));

J(3,1)=-V(4)*V(2)*SY(4,2)*sin(YT(4,2)-delta(4)+delta(2));
J(3,2)=-V(4)*V(3)*SY(4,3)*sin(YT(4,3)-delta(4)+delta(3));
J(3,3)=V(4)*V(1)*SY(4,1)*sin(YT(4,1)-delta(4)+delta(1)) +V(4)*V(2)*SY(3,2)*sin(YT(4,2)-delta(4)+delta(2))+V(4)*V(3)*SY(4,3)*sin(YT(4,3)-delta(4)+delta(3));
J(3,4)=V(4)*SY(4,2)*cos(YT(4,2)-delta(4)+delta(2));
J(3,5)=V(3)*SY(4,3)*cos(YT(4,3)-delta(4)+delta(3));

J(4,1)=V(2)*V(1)*SY(2,1)*cos(YT(2,1)-delta(2)+delta(1))+V(2)*V(3)*SY(2,3)*cos(YT(2,3)-delta(2)+delta(3))+V(2)*V(4)*SY(2,4)*cos(YT(2,4)-delta(2)+delta(4));   
J(4,2)=-V(2)*V(3)*SY(2,3)*cos(YT(2,3)-delta(2)+delta(3));
J(4,3)=-V(2)*V(4)*SY(2,4)*cos(YT(2,4)-delta(2)+delta(4));
J(4,4)=-V(1)*SY(2,1)*sin(YT(2,1)-delta(2)+delta(1))-V(3)*SY(2,3)*sin(YT(2,3)-delta(2)+delta(3))-V(4)*SY(2,4)*sin(YT(2,4)-delta(2)+delta(4))-V(2)*2*SY(2,2)*sin(YT(2,2));
J(4,5)=-V(2)*SY(2,3)*sin(YT(2,3)-delta(2)+delta(3));

J(5,1)=-V(2)*V(3)*SY(2,3)*cos(YT(2,3)-delta(3)+delta(2));
J(5,2)=V(3)*V(1)*SY(3,1)*cos(YT(3,1)-delta(3)+delta(1)) +V(3)*V(2)*SY(3,2)*cos(YT(3,2)-delta(3)+delta(2))+V(3)*V(4)*SY(3,4)*cos(YT(3,4)-delta(3)+delta(4));   
J(5,3)=-V(3)*V(4)*SY(3,4)*cos(YT(3,4)-delta(3)+delta(4));
J(5,4)=-V(3)*SY(3,2)*sin(YT(3,2)-delta(3)+delta(2));
J(5,5)=-V(1)*SY(3,1)*sin(YT(3,1)-delta(3)+delta(1))- ...
       V(2)*SY(3,2)*sin(YT(3,2)-delta(3)+delta(2))-V(4)*SY(3,4)*sin(YT(3,4)-delta(3)+delta(4))-...
       V(3)*2*SY(3,3)*sin(YT(3,3));



DP = Ps - P;
DQ = Qs - Q;
DC = [DP; DQ]
DX = J\DC;


delta(2)=delta(2)+DX(1);
delta(3)=delta(3) +DX(2);
delta(4)=delta(4) +DX(3);

V(2)= V(2)+DX(4);
V(3)= V(3)+DX(5);

V
delta




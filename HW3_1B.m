V = [1.05; 1; 1; 1.04];
delta = zeros(4,1);

YBUS = [ 23-j*46  -5+j*10    -8+j*16   -10+j*20
       -5+j*10  30-j*60    -10+j*30  -15+j*20
       -8+j*16  -10+j*30   23-j*61   -5+j*15
       -10+j*20 -15+j*20   -5+j*15   30-j*55];

SY= abs(YBUS); 
YT = angle(YBUS);
Psch=[-6; -5; 1];
Qsch=[-3; -2];

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

b= [ -46  +10    +16   +20
      +10  -60    +30  +20
      +16  +30    -61   +15
      +20  +20    +15   -55];
b1=b;

b1(1,:)=[];
b1(:,1)=[];
b2=b1
B1T = inv(b2)

b2(3,:)=[];
b2(:,3)=[];
B2=b2
B2T = inv(B2)

DeltaP = Psch - P
DeltaQ = Qsch - Q;


Ddelta=-B1T*(DeltaP/V)


DV=-B2T*(DeltaQ/V);

delta(2)=delta(2)+Ddelta(1);
delta(3)=delta(3)+Ddelta(2);
delta(4)=delta(4)+Ddelta(3);
V(2)=V(2)+DV(1);
V(3)=V(3)+DV(2);


V
delta

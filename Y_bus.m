function[Y] = ybus(zdata)
nl=zdata(:,1);
nr=zdata(:,2);
R=zdata(:,3);
X=zdata(:,4);
nbr=length(zdata(:,1));
nbus = max(max(nl), max(nr));
Z = R + j*X; 
y= ones(nbr,1)./Z;
Y=zeros(nbus,nbus);
for k = 1:nbr;
    if nl(k) > 0 & nr(k) > 0
    Y(nl(k),nr(k)) = Y(nl(k),nr(k)) - y(k);
    Y(nr(k),nl(k)) = Y(nl(k),nr(k));
    end
end
for n = 1:nbus
    for k = 1:nbr
    if nl(k) == n | nr(k) == n
    Y(n,n) = Y(n,n) + y(k);
    else, end
    end
end

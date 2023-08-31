j=sqrt(-1); i = sqrt(-1);
nl = linedata(:,1); nr = linedata(:,2); R = linedata(:,3);
X = linedata(:,4); Bc = j*linedata(:,5); a = linedata(:, 6);
nbr=length(linedata(:,1)); nbus = max(max(nl), max(nr));
Z = R + j*X; y= ones(nbr,1)./Z;        
for n = 1:nbr
if a(n) <= 0  a(n) = 1; else end
Y=zeros(nbus,nbus);     
               
for k=1:nbr;
       Y(nl(k),nr(k))=Y(nl(k),nr(k))-y(k)/a(k);
       Y(nr(k),nl(k))=Y(nl(k),nr(k));
    end
end
              
for  n=1:nbus
     for k=1:nbr
         if nl(k)==n
         Y(n,n) = Y(n,n)+y(k)/(a(k)^2) + Bc(k);
         elseif nr(k)==n
         Y(n,n) = Y(n,n)+y(k) +Bc(k);
         else, end
     end
end
clear Pgg
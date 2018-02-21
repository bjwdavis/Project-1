nx=600+1;              % the number of points in x direction
ny=600+1;              % the number of points in x direction
ymax=1.5;              % the max y value
xmax=1.5;              % the max x value 
dy=2*ymax/(ny-1);    % step length in y direction
dx=2*xmax/(nx-1);    % step length in x direction
flag=zeros(nx,ny);   % initialize the counts
kmax=200;            % number of max iterations 
zmax=100;
temp=zeros(1,kmax);
colormap(hot(20));    
k=1;
for j=1:nx
    for t=1:ny
        if flag(j,t)==0
         x=(j-1)*dx-xmax;
         y=(t-1)*dy-ymax;
         c=x+1i*y;   
         temp(1)=-c;
         k=1;
         while k<=kmax & abs(temp(k))<zmax
             k=k+1;
             temp(k)=temp(k-1)*temp(k-1)-c;
         end
         if k<kmax 
             for s=1:k
                 x=real(temp(s));
                 y=imag(temp(s));
                 if abs(x)<=xmax & abs(y)<=ymax
                     flag(round((x+xmax)/dx)+1,round((y+ymax)/dy)+1)=k+1-s;
                 end
             end
         else for s=1:k
                 x=real(temp(s));
                 y=imag(temp(s));
                 if abs(x)<=xmax & abs(y)<=ymax
                     flag(round((x+xmax)/dx)+1,round((y+ymax)/dy)+1)=20+kmax;
                 end
             end
         end
        end
    end
end
flag=flag/(21+kmax)*20;
image([-xmax xmax],[-ymax,ymax],flag)
axis xy
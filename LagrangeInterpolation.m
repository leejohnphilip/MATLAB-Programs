%% Lagrange Interpolation Program
%% by John Philip Lee
%% Mar. 10, 2017

function yresult=lab3(xvalue)

n=5;
x=[1,2,3,4,5,6];
y=[0,6,2,1,5,10];

fx=0;
lx=1;

for i=1:n+1
  for j=1:n+1
    if i~=j
      lx=lx*((xvalue-x(j))/((x(i)-x(j)))); %%setup Lx sum, where i~=j
    end
  end
  fx=fx+(y(i)*lx); %%multiplying y to Lx then accumulating
  lx=1; %%reset lx to 1 so j loop can accumulate sum of products again for next term's Lx
end

yresult=fx;
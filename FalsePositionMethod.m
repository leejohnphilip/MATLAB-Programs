%% False-Position Method Program
%% for f(x)=exp(-x)-x
%% by John Philip Lee

%clear
%clc

stop_criteria=input('Please input stopping percentage: '); %% user input desired stopping criteria
ea=100; %% starting accuracy that will meet desired accuracy

xu=input('Please input upper bound value: ');
xl=input ('Please input lower bound value: ');

funt=@(m)exp(-m)-m;
i=1; %%set counter for indexing matrix of roots
while ea>stop_criteria
  xr=xu-((funt(xu)*(xl-xu))/(funt(xl)-funt(xu)));
  if (exp(-xl)-xl)*(exp(-xr)-xr)<0
    xu=xr;
    xr=(xu-(funt(xu)*(xl-xu))/(funt(xl)-funt(xu)));
    
    if i>1
    ea=abs((xr-xu)/xr)*100;
    disp(['The % is: ', num2str(ea)]);
    end
    
    disp(['The root is: ', num2str(xr)]);
    i=i+1;
    
  elseif (exp(-xl)-xl)*(exp(-xr)-xr)>0
    xl=xr;
    xr=(xu-(funt(xu)*(xl-xu))/(funt(xl)-funt(xu)));
    
    if i>1
    ea=abs((xr-xl)/xr)*100;
    disp(['The % is: ', num2str(ea)]);
    end
    
    disp(['The root is: ', num2str(xr)]);
    i=i+1;
    
  elseif (exp(-xl)-xl)*(exp(-xr)-xr)==0
    ea=100;
    disp(['The root is:' num2str(xr)]);
    
  end
end
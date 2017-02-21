%% Fixed-Point Iteration Program
%% for f(x)=exp^(-x)-x
%% by John Philip Lee

%clear
%clc

stop_criteria=input('Please input stopping percentage: '); %% user input desired stopping criteria
ea=100; %% starting accuracy that will meet desired accuracy

c(1)=0.75; %% initial guess value ; user may opt to input
% c(1)=input('Enter guess value: ');


i=1; %%set counter for indexing matrix of roots
while ea>stop_criteria
  c(i+1,:)=exp(-(c(i)));
  
  disp(['The % is: ', num2str(ea)]);
  ea=abs((c(i+1)-c(i))/c(i+1))*100;
  i=i+1;
end

disp(['The % is: ', num2str(ea)]);
disp('--------------------------');
pause;
disp('The roots were: ');
disp (c);
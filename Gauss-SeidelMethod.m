%% Gaussian-Seidal Iterative Program
%% by: John Philip Lee

%clear
%clc

stopping_criteria=input('Enter stopping criteria in %: '); %% user input desired stopping criteria
ea=100; %% starting accuracy that will meet desired accuracy

a=[4,-1,-1;6,8,0;-5,0,12]; %% coefficients of the system of equations ; user may opt to input
% a=input('Enter coefficients of the system of equations in matrix form a(i,j)');

b=[-2;45;80]; %% constants of the system of equations ; user may opt to input
% b=input('Enter constants of the system of equations in matrix form b(i,j)');

e=[0,0,0]; %% initial guess values of the system of equations ; user may opt to input
% e=input('Enter guess values of the system of equations in matrix form c(i,j)');

loop_counter=1; %% to keep track of number of iterations

[rows, columns]=size(a);
disp(['Number of rows: ', num2str(rows)]);
disp(['Number of columns: ', num2str(columns)]);


%% PART I: INITIALIZING COEFFICIENT MATRIX WITH 0'S ON C(i,i) TERMS // ALL DIVIDED BY C(i,i) COEFFICIENT
  for i=1:rows
    for j=1:columns
      if i~=j
      d(i,j)=(-a(i,j))/a(i,i); 
      elseif i==j   %% to eliminate c(i,i) from coefficient matrix
        d(i,j)=0; 
      end
    end
   end
    
    
%% PART II: MAKING MATRIX OF X VALUES (x1,x2,x3) IN COLUMNS
%% Each row element is made of a sum of products of x values produced previously based on the index (i,j) of the coefficients being summed
while ea>stopping_criteria
    loop_counter=loop_counter+1;
    for i=1:rows
      e(loop_counter,i)=b(i)/a(i,i); %%Add constant to row below the row of zeros // all divided by coeff of c(i,i)
      for j=1:columns
        if j<i %% when j<i in coeff matrix, we need the new x value previously calculated (in same row of e):
               %% i.e. a(3,1)*e(2,1) and a(3,2)*e(2,2) for values of x1 & x2 in e(2,3) in 1st iteration
          e(loop_counter,i)=e(loop_counter,i)+d(i,j)*e(loop_counter,j);
        else
          e(loop_counter,i)=e(loop_counter,i)+d(i,j)*e(loop_counter-1,j);
        end
      end
    end
    
  %if loop_counter>2 %%1st iteration has no accuracy comparison
    ea(loop_counter-1)=abs((e(loop_counter,1)-e(loop_counter-1,1))/e(loop_counter,1))*100; 
 % end
end

disp('The values of ea are: ')
disp(ea')
disp('--------------------------')
pause
disp('The values of x are: ')
disp(e)

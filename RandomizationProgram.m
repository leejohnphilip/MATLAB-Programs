%% Randomization Program
%% for a given range of numbers
%% John Philip Lee

clear
clc

llim=input("Please input a lower bound: ");
ulim=input("Please input an upper bound: ");

%llim=10;
%ulim=20;
results=linspace(llim,ulim,ulim-llim+1);
datap=length(results);

r=round((ulim-llim)*rand+llim);
list(1)=r;
for i=2:datap
flag=1;
while flag==1
r=round((ulim-llim)*rand+llim);
flag=rcheck_list(r,list);
end
list(i)=r;
end
disp(list);
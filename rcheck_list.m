%% Supplemental Function to the Randomization Program
%% checks if number in range has been randomized
%% John Philip Lee

function flag = rcheck_list (r,list)
flag=0;
for i=1:length(list)
if r==list(i)
flag=1;
end
end

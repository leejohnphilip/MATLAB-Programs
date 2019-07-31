function [new_tensor, direction_cos] = transformation (old_tensor, old_ref_axis, new_ref_axis)

%% John Philip (JP) Lee
%% 20676108

%% create direction cosine and tensor matrices of 3x3 dimensions
%% for incrementing final answers
direction_cos=zeros(3,3);
new_tensor=zeros(3,3);

%% run nested loops to populate direction cosine based on old to new axes
for i=1:3
    for j=1:3
        direction_cos(i,j)=dot(new_ref_axis(i,:),old_ref_axis(j,:));
    end
end

%% run nested loops to populate new tensor by tensor transformation law with the transformed direction cosines and old tensor values
for i=1:3
    for j=1:3
        for k=1:3
            for l=1:3
                new_tensor(i,j)= new_tensor(i,j) + direction_cos(i,k)*direction_cos(j,l)*old_tensor(k,l);
            end
        end
       
    end
end
end

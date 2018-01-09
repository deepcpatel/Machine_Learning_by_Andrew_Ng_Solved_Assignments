function new_y = recode(y, class_size)
%This converts the y vector into matrix of Example_size x Class_Size dimensions

m=size(y,1);

new_y = zeros(m,class_size);

for i=1:m

	new_y(i,y(i))=1;

end


end
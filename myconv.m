%(a)
x1 = [1:150, fliplr(1:149)];
x1 = [x1,0];
x2 = ones(300,1);
length = 1:300;
figure, stem(length,x1);
figure, stem(length,x2);
%(b)
y = conv(x1,x2);
figure, stem(1:599,y);
%(c)
Matrix = zeros(598,300);
count = 0;
for i = 1:300
for j = 1:299
Matrix(count + j, i) = x1(j);
end
count = count + 1;
end
y2 = Matrix * x2;
figure, stem(1:598, y2);
%(d)
x1 = ones(300,1);
x2 = ones(300,1);
Matrix2 = zeros(599,300);
count2 = 0;
for i = 1:300
for j = 1:300
Matrix2(j+count2,i) = x1(j);
end
count2 = count2 + 1;
end
y3 = Matrix2 * x2;
figure, stem(1:599, y3);

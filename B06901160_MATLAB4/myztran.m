%(a)
syms z;
H_z = (0.0976*(z-1)^2*(z+1)^2) / ((z-0.3575-0.5889j)*(z-0.3575+0.5889j)*(z-0.7686-0.3338j)*(z-0.7686+0.3338j));
b = sym2poly(0.0976*(z-1)^2*(z+1)^2)
a = sym2poly(((z-0.3575-0.5889j)*(z-0.3575+0.5889j)*(z-0.7686-0.3338j)*(z-0.7686+0.3338j)))

n = linspace(0,99);
[r,p,k] = residuez(b,a);

z_=[1,1,-1,-1];
p_=[0.3575+0.5889j,0.3575-0.5889j,0.7686+0.3338j,0.7686-0.3338j];
k_=0.0976;
sos= zp2sos(z_, p_, k_);
a1=[1,sos(1,5),sos(1,6)];
a2=[1,sos(2,5),sos(2,6)];
b1=[sos(1,1),sos(1,2),sos(1,3)];
b2=[sos(2,1),sos(2,2),sos(2,3)];

%test
H1_z = (2*z/(2*z-1));

h_n = iztrans(H_z);
h1_n  = iztrans(H1_z);

x = (r(1)*p(1).^n) + (r(2)*p(2).^n) + (r(3)*p(3).^n) + (r(4)*p(4).^n);
subplot(3,3,1),stem(n, x, "."),title('h[n]');


%(b)
subplot(3,3,2),zplane(b,a),title('zplane');

%(c)

[H,w] = freqz(fliplr(b),fliplr(a),10000);
subplot(3,3,3),plot(w,20*log10(abs(H))),title('Magnitude of H(z)');
subplot(3,3,4),plot(w,angle(H)*180/pi),title('Phase of H(z)');

%(e)

[H1,w] = freqz(fliplr(b1),fliplr(a1),100);
[H2,w] = freqz(fliplr(b2),fliplr(a2),100);
H3 = zeros(1,100);
for n = 1:100
    H3(n) = ((H1(n))*(H2(n)));
end
subplot(3,3,5),plot(w,20*log10(abs(H1))),title('Magnitude of H1(z)');
subplot(3,3,6),plot(w,20*log10(abs(H2))),title('Magnitude of H2(z)');
subplot(3,3,7),plot(w,20*2*log10(abs(H3))),title('Magnitude of H3(z)');

%(f)
x_n = zeros(1,100);
x_n(1) = 1 ;
n1 = linspace(1,100,100);
y_n = filter((b),(a),x_n);
subplot(3,3,8),stem(n1,y_n),title('y[n]');




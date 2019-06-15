%(a)
Ts = 0.002;
f1 = 100;
M = 1000;
L = 16;
n = linspace(1,1000);
x_n = cos(2*pi*(n-1)*Ts)+2*cos(2*pi*f1*(n-1)*Ts);

%(b)
[b1,a1] = butter(L,0.1);
[H1,w1] = freqz(b1,a1,M);
y1 = filter(b1,a1,x_n);

%(c)
[b2,a2] = butter(L,[0.2 0.8]);
[H2,w2] = freqz(b2,a2,M);
y2 = filter(b2,a2,x_n);

%Plot
figure(3);
subplot(2,2,[1,2]),plot(n,x_n),title("x[n]");
subplot(2,2,3),plot(n,y1),title(" y[n] of b ");
subplot(2,2,4),plot(n,y2),title(" y[n] of c ");


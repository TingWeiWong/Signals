%(1.a)
n1 = linspace(1,100);
n2 = linspace(1,pi,100);
n3 = linspace(0,pi,100);
x_n = cos(2*pi*(n1-1)*0.1);
figure, plot (x_n)

%(1.b)
[b1,a1] = butter(3,0.1);
[H1,w1] = freqz(b1,a1,100);
print (H1);
y1 = filter(b1,a1,x_n);

%(1.c)
[b2,a2] = butter(7,0.1);
[H2,w2] = freqz(b2,a2,100);
y2 = filter(b2,a2,x_n);

%(1.d)
[b3,a3] = butter(3,0.5);
[H3,w3] = freqz(b3,a3,100);
y3 = filter(b3,a3,x_n);


%Plotting in subplot
figure(2);

subplot(3,3,1),plot(n2,20*log(abs(H1))),title("Magnitude response of (b)");
subplot(3,3,2),plot(n3,angle(H1)*180/pi),title("Phase of (b)");
subplot(3,3,3),plot(n1,y1),title("y[n] of (b)");
subplot(3,3,4),plot(n2,20*log(abs(H2))),title("Magnitude response of (c)");
subplot(3,3,5),plot(n3,angle(H2)*180/pi),title("Phase of (c)");
subplot(3,3,6),plot(n1,y2),title("y[n] of (c)");
subplot(3,3,7),plot(n2,20*log(abs(H3))),title("Magnitude response of (d)");
subplot(3,3,8),plot(n3,angle(H3)*180/pi),title("Phase of (c)");
subplot(3,3,9),plot(n1,y3),title("y[n] of ()");

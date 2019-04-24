% a)
n = linspace(-100, 100, 1001);
x = sinc(n);
figure, stem(n, x, ".");

% b) 
omega = 2*pi*n / 1001;
x_fft = fft(x);
figure, plot (omega,fftshift(abs(x_fft)));

% c)
w = 0.5*(1+cos(2*pi*n/50));
figure, stem (n,w);

% d)
y = x.*w;
figure, stem(n,y,".");

% e)
y_fft = fft(y);
figure, plot(omega, fftshift(abs(y_fft)));
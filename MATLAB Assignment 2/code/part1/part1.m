% ID 21701543
x = DTMFTRA([0 1 5 4 3]);
soundsc(x, 16384);

X = FT(x);
% Changed the linespace args 
% to make both amtrices the same length
omega = linspace(-16384 * pi, 16384 * pi, 16384 * 2.5 + 1);
omega = omega(1:end - 1);
figure
plot(omega, abs(X));
xlabel('Omega');
ylabel('Amplitude');
title('Fourier Transform Magnitude')


x = DTMFTRA([0 1 5 4 3]);
freq = 16384;

%%%%%%%%% Compute Xi(w) for i = 1, 2, 3, 4, 5 %%%%%%%%%%%
x1w = freqPlotter(x, 3);
x2w = freqPlotter(x, 5);
x3w = freqPlotter(x, 2);
x4w = freqPlotter(x, 4);
x5w = freqPlotter(x, 5);


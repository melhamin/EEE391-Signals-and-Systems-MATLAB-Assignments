% %%% We use built-in audiorecorder function to record the voice %%%%

% Define the sampling frequency, bits per sample and number of channels
% The following code is partially taken from the Mathworks
% documentation page for Matlab audiorecorder.
fs = 8192; 
bitsPerSample = 16; 
numOfChannels = 2; 
recordedSound = audiorecorder(fs, bitsPerSample, 1);
% Record a 10 second voice.
disp('Start speaking.');
recordblocking(recordedSound, 10);
disp('End of Recording.');
soundData = getaudiodata(recordedSound);
t = 0:1/fs:10-1/fs;
sound(soundData, fs);
figure
plot(t, soundData);
xlabel('t/s');
ylabel('Amplitude');
title('Recorded Sound Signal')

soundData = audioread("recSound.wav");

%%%%% Generate Echoed Sound %%%%%%%%%
fs = 8192; 
T = 10;
t=0:1/fs:T-1/fs;
% Generate y from x
M = 5;
y = generateEcho(soundData, fs);

% Plot y
figure
plot(t,y);
xlabel('t/s');
ylabel('Amplitude');
title(' Echoed Sound signal');
sound(y, fs);

%%%%%% Compute frequency response %%%%%%
omega=linspace(-fs * pi, fs * pi, fs * 10 + 1);
omega=omega(1:end-1);
Y = FT(y); 
X = FT(transpose(soundData));

H = Y./X;
% figure
plot(omega, abs(H));
xlabel('w');
ylabel('Amplitude');
title('Frequency Response H(w)');

%%%%%% Compute the impulse response %%%%%%
h = IFT(H)
figure
plot(t, h)
xlabel('t/s');
ylabel('Amplitude');
title('Impulse Response h(t)');

%%%%% Compute the estimated (echo cancelled) sound %%%%%%
Xe = Y./H
xe = IFT(Xe)
plot(t, xe);
xlabel('t/s');
ylabel('Amplitude');
title('Estimated speech (xe(t))');
sound(xe, fs);



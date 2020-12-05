Nfft=2^ceil(log2(length(y)));
Y=fftshift(fft(y,Nfft));
omegaY=(0:(Nfft-1))*(2*pi/Nfft)-pi;

figure(1)
clf
subplot(2,1,1);
plot(omegaY/pi,abs(Y));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})|')
title ('3a')

subplot(2,1,2);
plot(omegaY/pi,20*log(abs(Y)));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})|')
title ('3a dB')
Nfft=2^ceil(log2(length(y)));
Y=fftshift(fft(y,Nfft));
omegaY=(0:(Nfft-1))*(2*pi/Nfft)-pi;

%(a)

figure(1)
clf
subplot(2,1,1);
plot(omegaY/pi,abs(Y));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})|')
title ('3a')

subplot(2,1,2);
plot(omegaY/pi,20*log10(abs(Y)));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})| (dB)')
title ('3a dB')

%(c)

Wn=.18*pi;
hn=[1-2*cos(Wn) 1];
[Hn, WHn]=freqz(hn,1);

figure(2)
plot(WHn/pi, 20*log10(abs(Hn)))
xlabel('Frequency (\omega/\pi)')
ylabel('|Hnotch(e^{j\omega})|')
title('3c dB')

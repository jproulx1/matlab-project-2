Nfft=2^ceil(log2(length(y)));
Y=fftshift(fft(y,Nfft));
omegaY=(0:(Nfft-1))*(2*pi/Nfft)-pi;

%(a)

figure(1)
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

Wn=.179993*pi;
hn=[1 -2*cos(Wn) 1];
[Hn, WHn]=freqz(hn,1);

figure(2)
subplot(2,1,1);
plot(WHn/pi, 20*log10(abs(Hn)))
xlabel('Frequency (\omega/\pi)')
ylabel('|Hn(e^{j\omega})|')
title('3c dB')

fo=filter(hn, 1, y);
Nfftfo=2^ceil(log2(length(fo)));
Fo=fftshift(fft(fo,Nfftfo));
omegafo=(0:(Nfftfo-1))*(2*pi/Nfftfo)-pi;

subplot(2,1,2);
plot(omegafo/pi,abs(Fo));
xlabel('Frequency (\omega/\pi)')
ylabel('|Fo(e^{j\omega})|')
title('3c filtered')









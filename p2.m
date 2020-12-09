%% ECE 320 Matlab Project 2

Nfft = 2^ceil(log2(length(y)));
Y = fftshift(fft(y,Nfft));
omegaY = (0:(Nfft-1))*(2*pi/Nfft)-pi;

%(a)

figure(1)
subplot(2,1,1);
plot(omegaY/pi,abs(Y));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})|')
title ('Magnitude Spectrum |Y(e^{j\omega})|')
xn = [-0.8 0.7];
yn = [500 500];
text(xn, yn, "Noise")
xt = [-0.17 0.19];
yt = [4000 4000];
text(xt, yt, "Tone")
xs = [-0.5 0.3];
ys = [400 400];
text(xs, ys, "Speech")

subplot(2,1,2);
plot(omegaY/pi,20*log10(abs(Y)));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})| (dB)')
title ('Magnitude Spectrum |Y(e^{j\omega})| in dB')

% Zoomed Frequency Response
figure(2) 
plot(omegaY/pi,abs(Y));
xlabel('Frequency (\omega/\pi)')
ylabel('|Y(e^{j\omega})|')
title ('Magnitude Spectrum |Y(e^{j\omega})| (Zoomed)')
xlim([-0.22 0.22])
ylim([4000 4700])

%% (b), (c) and (d)

Wn = .179993*pi;
hn = [1 -2*cos(Wn) 1];
[Hn, WHn] = freqz(hn,1);

figure(2)
subplot(2,1,1);
plot(WHn/pi, 20*log10(abs(Hn)))
xlabel('Frequency (\omega/\pi)')
ylabel('|Hn(e^{j\omega})|')
title('Notch Filter in dB')

r = filter(hn, 1, y);
Nr = 2^ceil(log2(length(r)));
R = fftshift(fft(r,Nr));
omegaR = (0:(Nr-1))*(2*pi/Nr)-pi;

subplot(2,1,2);
plot(omegaR/pi,abs(Fo));
xlabel('Frequency (\omega/\pi)')
ylabel('|R(e^{j\omega})|')
title('Tone Filtered Signal')

%% (e) and (f)

alpha = 0.5;
N = 0:100;
hlpf = fir1(100, alpha);    % FIR Filter

[HLPF, omegaHLPF] = freqz(hlpf, 1);  % Frequency reponse

% FIR Filter Plot
figure(4)
subplot(2,1,1)
plot(omegaHLPF/pi, abs(HLPF))
title("Noise Filter Frequency Response HLPF(e^{j\omega})")
ylabel("|HLPF(e^{j\omega})|")
xlabel("Frequency (\omega/\pi)")

% Noise Filtering
s = filter(hlpf, 1, r);
Ns = 2^ceil(log2(length(s)));
S = fftshift(fft(s,Ns));
omegaS = (0:(Ns-1))*(2*pi/Ns)-pi;

% Filtered Signal S
subplot(2,1,2)
plot(omegaS/pi,abs(S));
xlabel('Frequency (\omega/\pi)')
ylabel('|S(e^{j\omega})|')
title('Noise Filtered Signal')









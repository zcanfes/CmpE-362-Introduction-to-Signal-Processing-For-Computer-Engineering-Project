[y,fs] = audioread('sound-trimmed.mp3');

modulated_wave = amp_boost(y, fs, 20);



sound(modulated_wave, fs)

audiowrite('.\amplified.wav', modulated_wave, fs);
% ---------------

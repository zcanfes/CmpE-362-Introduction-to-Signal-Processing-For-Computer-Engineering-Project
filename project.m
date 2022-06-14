[y,fs] = audioread('sound-trimmed.mp3');

y = reverse(y);

y = amp_boost(y, fs, 20);

y = sound_surround(modulyated_wave, fs);


sound(y, fs)

audiowrite('.\amplified.wav', y, fs);
% ---------------

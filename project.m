[y,fs] = audioread('sound-trimmed.mp3');

y = reverse(y);

y = amp_boost(y, fs, 3);

y = sound_surround(y, fs);

y = bass_boost(y, fs, 20);


play_sound(y, fs, 0.22)


pause(6)

audiowrite('.\amplified.wav', y, fs);
% ---------------

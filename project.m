clear sound
[y,fs] = audioread('Muriel.mp3');
[t,ft] = audioread('piano_2.mp3');
[k,fk] = audioread('drum_2.wav');
[b,fb] = audioread("sound-trimmed.mp3");

% y = reverse(y);

% y = amp_boost(y, fs, 2.20);

% y = sound_surround(y, fb);

% y = bass_boost(y,fs,25);

y = combine_sounds(y,t,k,fs,ft,fk);



play_sound(y,fs,1);

%audiowrite('.\amplified.wav', y, fs);
% ---------------

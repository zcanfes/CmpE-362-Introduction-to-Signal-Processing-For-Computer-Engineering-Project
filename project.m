clear sound
[y,fs] = audioread('guitar.wav');
[t,ft] = audioread('piano_sad.wav');
[k,fk] = audioread('drum.wav');


% y = reverse(y);

% y = amp_boost(y, fs, 0.20);

% y = sound_surround(y, fs);

% y = bass_boost(y,fs,15);

y = combine_sounds(y,t,k,fs,ft,fk);



play_sound(y,fs,1);

%audiowrite('.\amplified.wav', y, fs);
% ---------------

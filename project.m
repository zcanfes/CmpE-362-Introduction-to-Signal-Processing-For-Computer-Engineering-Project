[y,fs] = audioread('sound-trimmed.mp3');

amp_boost(y, fs, 20);


% ---------------

function modulated_wave = amp_boost(y, fs, boost)
    num_channel = size(y, 2);

    for i = 1:num_channel
        y_channel = y(:, i).';

        l=length(y_channel);
        t = (1:l)/fs; % Find the time interval to plot
        
        AM = boost .* ones(1, l);

        if i == 1
            modulated_wave = AM .* y_channel;
        else
            wave = AM .* y_channel;
            modulated_wave = vertcat(modulated_wave, wave);
        end
    end
    modulated_wave = modulated_wave.';
    sound(modulated_wave, fs)

    audiowrite('.\amplified.wav',modulated_wave, fs);
end




function modulated_wave = sound_surround(y, fs)
    N = length(y); % sample lenth
    s = (N/fs); % total time span of audio signal
    
    
    % Number of modulated waves
    M = 1;
    % Modulated amplitude sample list
    Mtt = 0:2 * pi * M / fs / s:2 * pi * M;
    Mtt = Mtt(1:N);
    % Shaper function for modulator. You may try another shapes.
    AM_first = sin(Mtt);
    AM_second = cos(Mtt);
    
    num_channel = size(y, 2);
    
    for i = 1:num_channel
        y_channel = y(:, i).';
    
        l=length(y_channel);
        t = (1:l)/fs; % Find the time interval to plot
    
        if i == 1
            modulated_wave = AM_first .* y_channel;
        else
            wave = AM_second .* y_channel;
            modulated_wave = vertcat(modulated_wave, wave);
        end
    end
    modulated_wave = modulated_wave.';
end



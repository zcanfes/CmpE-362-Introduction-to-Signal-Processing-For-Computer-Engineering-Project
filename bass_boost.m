
function modulated_wave = bass_boost(y, fs, bass)

    y = amp_boost(y, fs, 0.25 );

    num_channel = size(y, 2);
    tt = 0: 1 / fs : length(y)/fs - 1/fs;

    other = fft(sin(bass*pi.*tt)/pi.*tt)';
    modulated_wave = zeros(size(y));
    for i = 1:num_channel
        Y = fft(y(:,i));
                  
        modulated_wave(:,i) = ifft(Y .* other);
    end

    modulated_wave = y + modulated_wave;
end

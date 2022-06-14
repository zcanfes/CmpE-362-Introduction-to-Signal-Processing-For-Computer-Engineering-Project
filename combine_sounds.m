function combined_wave = combine_sounds(y1, y2, y3, fs1, fs2, fs3)
    if size(y1, 2) == 1
        y1_channel_left = y1(:, 1).';
        y1_channel_right = y1(:, 1).';
    else 
        y1_channel_left = y1(:, 1).';
        y1_channel_right = y1(:, 2).';
    end
    if size(y2, 2) == 1
        y2_channel_left = y2(:, 1).';
        y2_channel_right = y2(:, 1).';
    else 
        y2_channel_left = y2(:, 1).';
        y2_channel_right = y2(:, 2).';
    end
    if size(y3, 2) == 1
        y3_channel_left = y3(:, 1).';
        y3_channel_right = y3(:, 1).';
    else 
        y3_channel_left = y3(:, 1).';
        y3_channel_right = y3(:, 2).';
    end

    l1=length(y1_channel_left);
    l2=length(y2_channel_left);
    l3=length(y3_channel_left);

    l = min([l1 l2]);

    base_l = y3_channel_left;
    base_r = y3_channel_right;
    for i = 0:l3:l
        y3_channel_left = cat(2,y3_channel_left,base_l);
        y3_channel_right = cat(2,y3_channel_right,base_r);
    end
    

    combined_wave = vertcat(amp_boost(y1_channel_left(1:l), fs1, 3) + y2_channel_left(1:l) + y3_channel_left(1:l), y1_channel_right(1:l) + amp_boost(y2_channel_right(1:l), fs2, 3) + y3_channel_right(1:l));
    combined_wave = combined_wave.';
end
      
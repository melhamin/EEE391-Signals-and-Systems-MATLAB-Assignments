function [output] = DTMFTRA(numbers) 
    % Low and High group frequencies
    fr_low = [697 770 852 941];
    fr_high = [1209 1336 1477];
    % Sampling period, and frequency    
    fs = 16384;    
    % Output to hold the tones for each number
    x = [];
    
    duration_per_tone = 0.5;
    t = linspace(0, duration_per_tone, duration_per_tone * fs);
    % Find the index in the low and high group frequency lists
    % for each of the numbers
    for N = 1: length(numbers)  
        number = numbers(N);
        switch number
            case 0, fl_idx = 4; fh_idx = 1;
            case '#', fl_idx = 4; fh_idx = 2;
            case '*', fl_idx = 4; fh_idx = 3;
            otherwise 
                fh_idx = mod(number -1, 3) + 1; fl_idx = (number - fh_idx) / 3 + 1;
        end
        % Sum the high and low group freq for the number and play it
        % t = 0:1 / fs:0.5;
        y1 = cos(2 * pi * fr_low(fl_idx) * t);
        y2 = cos(2 * pi * fr_high(fh_idx) * t);
        d = (y1 + y2) / 2;        
        x = [x d];
    end    
    output = x;
end
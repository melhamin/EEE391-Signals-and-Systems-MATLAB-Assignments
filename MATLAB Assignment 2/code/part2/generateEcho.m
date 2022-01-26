function [out] = generateEcho(soundData, fs)
    x = transpose(soundData);
    len = length(x);
    Ai = [0.8, 0.6, 0.4, 0.2, 0.05];    
    ti = [0.5, 1, 1.5, 2, 3];    
    out = zeros(1, len);

    for i=1:length(Ai)
        xi = [zeros(1, ti(i) * fs) Ai(i) * x(1, 1:len-ti(i) * fs)];
        out = out + xi;
    end    
    out = x + out;
end
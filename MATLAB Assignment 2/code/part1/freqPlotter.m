function [out] = freqPlotter(x, idx)
    % Define frequency and omega
    freq = 16384;
    omega = linspace(-16384 * pi, 16384 * pi, 16384 * 2.5 + 1);
    omega = omega(1:end - 1);
    % Build rectangular signal for the given portion of signal
    % i.e. idx = 1 => a rect signal between 0 <= t <= 0.5
    recX1 = [ones(1, (idx * 0.5) * freq) zeros(1, (2.5 - idx * 0.5) * freq)]
    plot(recX1)
    % Multiply matrices and find FT
    X1w = x .* recX1; 
    X1w = FT(X1w);
    out = X1w;
    figure 
    plot(omega,abs(X1w));
    xlabel('omega');
    ylabel('Amp');    
    title(sprintf('FTM of X%d', idx))
end
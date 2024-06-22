
duration = 15;  % seconds
sampling_rate = 44100;  % Hz
duration_fifo = 0.05; % duration of the fade-in/fade-out (in s)

for f0 = [110, 220, 330, 440, 550, 660, 770, 880]
    for alpha = [1.001, 1.01, 1.05, 1.1, 1.3, 1.4, 1.6, 1.8, 2.0]
        two_frequencies = generate_two_sinusoids(duration, f0, f0*alpha, 1, sampling_rate, 0) ;
        audiowrite(['f0_', num2str(f0), '_alpha_',num2str(alpha),'.wav'], two_frequencies ./ max(abs(two_frequencies)), sampling_rate) ;
    end
end



function two_frequencies = generate_two_sinusoids(duration, f0, f1, a, sampling_rate, phi)
    t = linspace(0, duration, floor(sampling_rate * duration));
    two_frequencies = cos(2 * pi * f0 * t) + a * cos(2 * pi * f1 * t + phi);
end



%% clear
clear;
close;
clc
%%
d = 20e-3; % meters
Z1 = 399j; % Surface impedance 1
Z2 = 133j; % Surface impedance 2
eta = 120 * pi; % Intrinsic impedance of free space
c = 3e8; % Speed of light

% Calculate refractive indices n1 and n2
n1 = sqrt(1 - (Z1/eta)^2); % For Z1
n2 = sqrt(1 - (Z2/eta)^2); % For Z2

% Mode numbers and frequency setup
m_values = 0:9;
f_max = 50e9; % 50 GHz

figure;
hold on;

for m = m_values
    % Compute cutoff frequency for mode m
    f_c = (m + 1) * c / (2 * d * real(n1)); % Use real part for cutoff
    
    if f_c > f_max
        continue; % Skip modes with cutoff above 50 GHz
    end
    
    % Frequency array from cutoff to 50 GHz
    f = linspace(f_c, f_max, 100);
    w = 2 * pi * f; % Angular frequency
    
    % Calculate Kz using the dispersion relation
    Kz = sqrt((w * real(n1) / c).^2 - (pi * (m + 1) / d).^2);
    
    % Convert to GHz for plotting
    f_GHz = f / 1e9;
    
    % Plot Kz vs f
    plot(Kz, f_GHz, 'LineWidth', 1.5, 'DisplayName', sprintf('m=%d', m));
end

xlabel('$K_z$ (rad/m)', 'Interpreter', 'latex');
ylabel('Frequency (GHz)', 'Interpreter', 'latex');
title('Frequency vs. $K_z$ for Reactive Surface Impedances', 'Interpreter', 'latex');
legend('Location', 'northeast');
grid on;
hold off;

%%
d = 20e-3; % meters
Z2 = 133j; % Surface impedance 2
Z1 = 8*Z2; % Surface impedance 1

eta = 120 * pi; % Intrinsic impedance of free space
c = 3e8; % Speed of light

% Calculate refractive indices n1 and n2
n1 = sqrt(1 - (Z1/eta)^2); % For Z1
n2 = sqrt(1 - (Z2/eta)^2); % For Z2

% Mode numbers and frequency setup
m_values = 0:9;
f_max = 50e9; % 50 GHz

figure;
hold on;

for m = m_values
    % Compute cutoff frequency for mode m
    f_c = (m + 1) * c / (2 * d * real(n1)); % Use real part for cutoff
    
    if f_c > f_max
        continue; % Skip modes with cutoff above 50 GHz
    end
    
    % Frequency array from cutoff to 50 GHz
    f = linspace(f_c, f_max, 100);
    w = 2 * pi * f; % Angular frequency
    
    % Calculate Kz using the dispersion relation
    Kz = sqrt((w * real(n1) / c).^2 - (pi * (m + 1) / d).^2);
    
    % Convert to GHz for plotting
    f_GHz = f / 1e9;
    
    % Plot Kz vs f
    plot(Kz, f_GHz, 'LineWidth', 1.5, 'DisplayName', sprintf('m=%d', m));
end

xlabel('$K_z$ (rad/m)', 'Interpreter', 'latex');
ylabel('Frequency (GHz)', 'Interpreter', 'latex');
title('Frequency vs. $K_z$ for Reactive Surface Impedances', 'Interpreter', 'latex');
legend('Location', 'northeast');
grid on;
hold off;
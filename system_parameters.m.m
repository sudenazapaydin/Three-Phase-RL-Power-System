% parameters.m
% ELK2018 Güç Sistemleri Projesi
% Üç Fazlı RL Yüklü Güç Sistemi

clc;
clear;

%% Sistem Parametreleri

% Şebeke
V_LL = 380;          % Hat gerilimi [V]
f = 50;              % Frekans [Hz]
w = 2*pi*f;          % Açısal frekans [rad/s]

%% Nominal Yük Parametreleri

P = 30e3;            % Aktif güç [W]
Q = 22.5e3;          % Reaktif güç [VAr]

pf = 0.8;            % Güç faktörü

%% Faz Hesapları

V_phase = V_LL/sqrt(3);     % Faz gerilimi [V]

S = P + 1j*Q;               % Kompleks güç
S_phase = S/3;              % Faz başına kompleks güç

Z_phase = (V_phase^2)/conj(S_phase);

R_phase = real(Z_phase);    % Faz direnci [Ohm]
X_L = imag(Z_phase);        % Endüktif reaktans [Ohm]

L_phase = X_L/w;            % Faz endüktansı [H]

%% Hat Parametreleri

R_line = 0.01;              % Hat direnci [Ohm]

%% Simülasyon Parametreleri

Ts = 1e-5;                  % Örnekleme zamanı
Tsim = 0.1;                 % Simülasyon süresi

%% Kompanzasyon Parametreleri

pf_target = 0.95;           % Hedef güç faktörü

phi1 = acos(pf);
phi2 = acos(pf_target);

Qc = P*(tan(phi1)-tan(phi2));   % Gerekli kompanzasyon gücü [VAr]

%% Arıza Parametreleri

fault_start = 0.04;         % Arıza başlangıç zamanı [s]
fault_end = 0.08;           % Arıza bitiş zamanı [s]

Rf = 0.001;                 % Arıza direnci [Ohm]
Rg = 0.001;                 % Toprak direnci [Ohm]

%% Bilgi Yazdırma

disp('=== Sistem Parametreleri ===')

fprintf('Hat Gerilimi      = %.1f V\n',V_LL)
fprintf('Frekans           = %.1f Hz\n',f)

fprintf('Aktif Güç         = %.1f kW\n',P/1000)
fprintf('Reaktif Güç       = %.1f kVAr\n',Q/1000)

fprintf('Faz Direnci       = %.2f Ohm\n',R_phase)
fprintf('Faz Endüktansı    = %.3f mH\n',L_phase*1000)

fprintf('Kompanzasyon Qc   = %.2f kVAr\n',Qc/1000)
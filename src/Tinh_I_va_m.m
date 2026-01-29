clc; clear;

% === THONG SO VAT LIEU: NHUA (PLASTIC) ===
rho = 900; % kg/m3 (Khoang gia tri cua Polypropylene)

% === KICH THUOC ROBOT (Giu nguyen kich thuoc lon) ===
% Link 1: L=7m, R=2m
% Link 2: L=11m, R=2m
% Link 3: L=7m, R=2m
L = [7, 11, 7]; 
R = [2, 2, 2]; 

fprintf('--- TINH TOAN THONG SO ROBOT VAT LIEU NHE (PLASTIC) ---\n');
fprintf('Khoi luong rieng: %.0f kg/m3\n\n', rho);

% Bien luu ket qua de copy
masses = zeros(3,1);
inertias = zeros(3,1);

for i = 1:3
    % 1. The tich (Hinh tru dac)
    V = pi * R(i)^2 * L(i);
    
    % 2. Khoi luong
    m = rho * V;
    masses(i) = m;
    
    % 3. Momen quan tinh (Truc quay vuong goc tai trong tam)
    % I = (1/4)*m*R^2 + (1/12)*m*L^2
    I = (1/4)*m*R(i)^2 + (1/12)*m*L(i)^2;
    inertias(i) = I;
    
    % In ket qua
    fprintf('LINK %d (L=%.0fm, R=%.0fm):\n', i, L(i), R(i));
    fprintf('  => m%d = %.4f kg\n', i, m);
    fprintf('  => I%d = %.4f kg.m^2\n', i, I);
    fprintf('----------------------------------\n');
end

fprintf('\n--- COPY DOAN NAY VAO CODE CONTROLLER ---\n');
fprintf('m1 = %.5f; \n', masses(1));
fprintf('m2 = %.5f; \n', masses(2));
fprintf('m3 = %.5f; \n', masses(3));
fprintf('\n');
fprintf('I1 = %.5f; \n', inertias(1));
fprintf('I2 = %.5f; \n', inertias(2));
fprintf('I3 = %.5f; \n', inertias(3));
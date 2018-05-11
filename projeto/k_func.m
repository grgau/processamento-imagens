
function [saida] = k_func(xi, xj, sigma)
    dist = abs(xi-xj);
    numerador = dist^2;
    denominador = (sigma^2)*2;
    expoente = -1 * (numerador/denominador);
    saida = exp(expoente);
end
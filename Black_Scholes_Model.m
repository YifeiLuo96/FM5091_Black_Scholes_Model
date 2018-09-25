%Black_Scholes_Model
%S: Underlying price, K: Strike price, r: risk-free rate (decimal), T: tenor (year), sigma: volatility (decimal).
d1 = @(S, K, r, T, sigma) (log(S./K) + (r + sigma.^2 ./ 2) .* T) ./ (sigma .* sqrt(T));
d2 = @(S, K, r, T, sigma) (log(S./K) + (r - sigma.^2 ./ 2) .* T) / (sigma .* sqrt(T));
Call_Price = @(S, K, r, T, sigma) S .* normcdf(d1(S, K, r, T, sigma),0,1) - K .* exp(-r .* T) .* normcdf(d2(S, K, r, T, sigma), 0, 1);
%Call_Price calculates the price of an European call option.
Put_Price = @(S, K, r, T, sigma) K .* exp(-r .* T) .* normcdf(-d2(S, K, r, T, sigma), 0, 1) - S .* normcdf(-d1(S, K, r, T, sigma), 0, 1);
%Put_Price calculates the price of an European put option.
Call_Delta = @(S, K, r, T, sigma) normcdf(d1(S, K, r, T, sigma), 0, 1);
%Call_Delta calculates the call option delta.
Put_Delta = @(S, K, r, T, sigma) normcdf(d1(S, K, r, T, sigma), 0, 1) - 1;
%Put_Delta calculates the put option delta.
Gamma = @(S, K, r, T, sigma) normpdf(d1(S, K, r, T, sigma), 0, 1)./(S .* sigma .* sqrt(T));
%Gamma calculates the call/put option gamma.
Vega = @(S, K, r, T, sigma) S .* normpdf(d1(S, K, r, T, sigma), 0, 1) .* sqrt(T);
%Vega calculates the call/put option vega.
Call_Theta = @(S, K, r, T, sigma) (-S .* normcdf(d1(S, K, r, T, sigma), 0, 1) .* sigma)./(2 .* sqrt(T)) - r .* K .* exp(-r .* T) .* normcdf(d2(S, K, r, T, sigma), 0, 1);
%Call_Theta calculates the call option theta.
Put_Theta = @(S, K, r, T, sigma) (-S .* normcdf(d1(S, K, r, T, sigma), 0, 1) .* sigma)/(2 .* sqrt(T)) + r .* K .* exp(-r .* T) .* normcdf(-d2(S, K, r, T, sigma), 0, 1);
%Put_Theta calculates the put option theta.
Call_Rho = @(S, K, r, T, sigma) K .* T .* exp(-r .* T) .* normcdf(d2(S, K, r, T, sigma), 0, 1);
%Call_Rho calculates the call option rho.
Put_Rho = @(S, K, r, T, sigma) -K .* T .* exp(-r .* T) .* normcdf(-d2(S, K, r, T, sigma), 0, 1);
%Put_Rho calculates the put option rho.








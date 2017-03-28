function [wavel,waver] = IID(theta, x, fs)
    r = 0.09; % diameter of a head 18cm
    c = 344; % the speed of sound 344m/s
    Fx = fft(x);
    %N = length(Fx);
    %k = 1:1:N;
    s = fs;
    beta = 2*c/r;
    Hl = ((1+cos(theta + pi/2))*s + beta)/(s+beta);
    Hr = ((1+cos(theta - pi/2))*s + beta)/(s+beta);
    
    Fwavel = Fx.*Hl;
    wavel = ifft(Fwavel);
    
    Fwaver = Fx.*Hr;
    waver = ifft(Fwaver);
    
end